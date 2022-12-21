workspace = "network"

region = "us-east-2" # Ohio

public_subnet_inputs = [
    {
        availability_zone = "a"
        cidr_block        = "10.0.1.0/24"
    },
    {
        availability_zone = "b"
        cidr_block        = "10.0.2.0/24"
    },
    {
        availability_zone = "c"
        cidr_block        = "10.0.3.0/24"
    }
]

private_subnet_inputs = [
    {
      availability_zone = "a"
      cidr_block        = "10.0.4.0/24"
    },
    {
      availability_zone = "b"
      cidr_block        = "10.0.5.0/24"
    },
    {
      availability_zone = "c"
      cidr_block        = "10.0.6.0/24"
    }
  ]
