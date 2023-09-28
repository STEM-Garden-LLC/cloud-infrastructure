########################
##    Common Roles    ##
########################

# Here in the sub-account we only need to create a Role that allows members of a Group in the Root Account to assume it. 

module "club_host_assumable_roles" {
  source = "../../../modules/assumable_roles"
}