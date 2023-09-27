# Description

Creates an AWS Organizations OU and Accounts within it.

# Warning 

Certain parts of accounts, such as the account email address, cannot be updated with out a very long painful destroy and recreate process. Be sparing about updating this module. 

It would also be best to tag a release named for this module and use that git tag in the module source input instead of just the local path.
