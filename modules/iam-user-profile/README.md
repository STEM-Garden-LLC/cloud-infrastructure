# Intent of this module

This module will probably only be used in one place: the `aws-root` workspace.
That workspace uses Access Keys belonging to the Organization's Management Account.
IAM Users created within the Management Account may be added to groups that have policies
allowing them to assume Roles in other project Accounts belonging to the Organization.
This allows all users to be centrally managed, enabling certain settings (such as password 
self-management) to be easily kept uniform across the Org, while other settings (such as
membership in the "developers" group and the actionsthat users in the "developers" group 
are allowed to perform) can be controlled on a project-by-project basis.

# To use this module

## To add a new member to the team:

1. Add a new username to the `users` input var value defined in `aws-root/terraform.auto.tfvars` 
1. Run an `apply` in the `aws-root` workspace to create an IAM User. 
1. In the output find the new user's randomly generated initial password.
1. Send the new user their username and generated password via email. 
1. The new user should go to https://signin.aws.amazon.com/ and enter the Account alias "stem-garden-llc" along with their IAM user name and temporary password.
1. This will redirect them to a page to reset their password.

## Security

Temporary passwords do not need to be encrypted to be sent to new users, however, it is best to verify the new user is ready and expecting to recieve their temporary credentials. They should use them to sign in for the first time promptly and confirm with the Admin adding them that they have successfully reset their password. In case the temporary credentials are intercepted and used by someone other than intended the user should be destroyed immediately by removing the username from the input variable value and running an `apply`.