# WARNING:
# Multiple aws_iam_group_membership resources with the same group name will produce inconsistent behavior!

#########################################
##    Read Root & Self Manage Login    ##
#########################################

resource "aws_iam_group_membership" "all_team_members" {
  name = "all-team-members"  
  group = aws_iam_group.all_team_members.name
  # All users seen in iam-users.tf including imported and created
  users = setunion(
    [ aws_iam_user.nigel_wilson.name ],
    toset([ for profile in module.users : profile.username ])
  )
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

