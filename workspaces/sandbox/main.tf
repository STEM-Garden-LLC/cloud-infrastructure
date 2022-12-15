resource "aws_iam_role" "role" {
  name               = "access-key-generator-role"
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

resource "null_resource" "dependencies" {
  provisioner "local-exec" {
    command = "pip install -r ./lambda/requirements.txt -t ./lambda/app/"
  }
}

resource "aws_lambda_function" "access_key_generator" {
  function_name    = "access-key-generator"
  role             = aws_iam_role.role.arn
  filename         = "access-key-generator.zip"
  handler          = "lambda_function.handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.8"
  timeout          = 30
  tags             = local.tags
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "test_ec2_instance" {
  ami = var.ec2_ami
  instance_type =  var.instance_type
  
  availability_zone = var.availability_zone
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  associate_public_ip_address = false
  
  # Cannot be used in combination with aws_ebs_volume and aws_volume_attachment resources on a given instance.
  ebs_block_device = {
    volume_type = standard
    volume_size = 20 # GiB
  }

  host_resource_group_arn = var.host_resource_group_arn

  # placement_group = null # How is placement group different from resource group?
  # tenancy = # If the instance is in a VPC / on dedicated hardware. Enum: default, dedicated, host

}
