# WARNING:
# Multiple aws_iam_group_membership resources with the same group name will produce inconsistent behavior!

#########################################
##    Read Root & Self Manage Login    ##
#########################################

resource "aws_iam_group_membership" "all_team_members" {
  name = "users-who-can-self-manage-login"  # This will be ALL users so perhaps it makes more sense to create a group that is ALL users and attatch multiple policies including the self manage policy.  

  users = [
    aws_iam_user.nigel_wilson.name,
    module.users.nigels-test-user.name,
    module.users.bruce-lindman.name,
  ]

  group = aws_iam_group.all_team_members
}


############################
##  STEM Garden Homepage  ##
############################


####################
##  Mastery Math  ##
####################



#########################
##  Club Hosting Tool  ##
#########################

