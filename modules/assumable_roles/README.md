# Intent of this module

This module is meant to be used in tandem with the `assume_role_policies` module.
Together these modules provide a concise and convenient way to create IAM Roles in the managed accounts that can be assumed by Groups of Users in the management acount.

The `assume_role_policies` module will be applied in the `aws-root` workspace to create a set of IAM Policies that will be attached to Groups in the Management Account to enable members of those Groups to use `sts:AssumeRole` to access the Roles which this module creates in the Project Accounts. 

# Usage Note

This module is to be used in the Project Accounts. It **only** creates IAM Roles in the Project Accounts that have trust policies allowing Users belonging to the Organization's Management Account to assume them. These trust policies cause the Role to trust any User in the Management Account, they do not specify which Users can assume the Role. These trust policies alone are not sufficient for a User to be able to assume these Roles. 


## To enable a User to assume one of these Roles 

1. Verify that this module has been applied in the Project Account. 
1. Identify the Group in the Management Account that allows Users to assume the desired Role in a Project Account.
1. In the `aws-root` workspace, add the User to the Group. 

# To create a new Level of Access

1. In the Project Account, either create a custom Role from scratch or add the name of an AWS Managed IAM policy to the `assumable_roles` module call to create a Role attached to just that Policy that trusts the Management Account.

1. In the Management Account, create a new Group with a name that indicates the project name and the level of access that Users in it are granted. This is handled in the `workspaces/project-name/shared` directory. 
1. Create an IAM Policy to attach to the Group that grants access to `sts:AssumeRole` specifying the ARN of the Role just created in the Project Account.
