#########################################
##  Organization & Management Account  ##
#########################################

import {
  to = aws_organizations_organization.sgllc_org
  id = "o-c2jf6qw1ou"
}

import {
  to = aws_organizations_organizational_unit.root_ou
  id = "r-p2mx"
}

import {
  to = aws_organizations_account.stem_garden_llc
  id = "889823018333"
}

############################
##  STEM Garden Homepage  ##
############################

import {
  to = aws_organizations_organizational_unit.stem_garden_ou
  id = "ou-p2mx-9w3b2mnl"
}

# No Accounts to import here, will create using TF
# import {
#   to = aws_organizations_account.stem_garden_dev
#   id = "111111111111"
# }

####################
##  Mastery Math  ##
####################

import {
  to = aws_organizations_organizational_unit.mastery_math_ou
  id = "ou-p2mx-6hyxrmrf"
}

import {
  to = aws_organizations_account.mastery_math_dev
  id = "496750456511"
}

import {
  to = aws_organizations_account.mastery_math_prod
  id = "529386439094"
}

#########################
##  Club Hosting Tool  ##
#########################

resource "aws_organizations_organizational_unit" "chessclubhost_ou" {
  name      = "Club Host Tool"
  parent_id = aws_organizations_organization.sgllc_org.roots[0].id
}

resource "aws_organizations_account" "account" {
  name  = "Club Host Tool Prod"
  email = "chessclubhost+prod@stemgarden.org"
}