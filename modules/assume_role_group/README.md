# Description

- Create an IAM Group in the Management Account
- Specify a list of IAM Users to make Group members
- Specify a list of AWS IAM Roles created by the `assumable_roles` module in Project Accounts to let group members assume.

# TODO: Adapt the following written for assume_role_policies

# Intent of this module

This module is meant to be used in tandem with the `assumable_roles` module.
Together these modules provide a concise and convenient way to create IAM Roles in the managed accounts that can be assumed by Groups of Users in the management acount.

The `assumable_roles` module will be applied in the project `workspaces/...` to create IAM Roles in the Project Accounts that trust the management account to use `sts:AssumeRole`. This module is responsible for creating the Policies that will be attached to Groups in the management account. These Policies specify specify which Project Account Roles members of the Group can assume. 

# Usage Note

This module is to be used in the Management Account. It **only** creates IAM Policy resources that enable Users/Groups belonging to the Organization's Management Account to assume roles in other accounts. These Policies do not specify any actions other that `sts:AssumeRole`. The policies that grant access to resources are created in the Project Accounts using AWS managed policies.
