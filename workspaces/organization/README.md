

All accounts besides the management account should reside inside an OU, not at the Root layer of the Organization.


# Email Addresses for AWS Account Creation

There are two main options:

1. Use + address syntax such as aws+prod@stemgarden.org. The advantage of this is that there is no setup required. There is already a Google Group crated with the email address aws@stemgarden.org and all variations with a + component will be delivered to it. 

1. Create a Google Group per AWS Account. This requires the additional set up of creating Groups in the Google Admin console but it makes it easy to target notifications at the people to whom they are relevant because unlike with + addressing each environment will have its own inbox.

Decision: Use the former option. The statden advantage of the latter approach is not real. "It makes it easy to target notifications at the people to whom they are relevant". First of all, there is only one person working on this. Even when the number of collaborators grows the number of people who need to recieve aws account-level notifications will remain small. Other notifications may be configured for things like CloudWatch alarms later on. 
