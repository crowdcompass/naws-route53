require 'rubygems'
require 'bundler/setup'

AWS_ID = "BogusAWSID"
AWS_KEY = "/Ml61L9VxlzloZ091/lkqVV5X1/YvaJtI9hW4Wr9"

CREATE_HOSTED_ZONE_RESPONSE_XML = <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<CreateHostedZoneResponse xmlns="https://route53.amazonaws.com/
doc/2010-10-01/">
   <HostedZone>
      <Id>/hostedzone/Z1PA6795UKMFR9</Id>
      <Name>example.com.</Name>
      <CallerReference>myUniqueIdentifier</CallerReference>
      <Config>
         <Comment>This is my first hosted zone.</Comment>
      </Config>
   </HostedZone>
   <ChangeInfo>
      <Id>/change/C1PA6795UKMFR9</Id>
      <Status>PENDING</Status>
      <SubmittedAt>2010-09-10T01:36:41.958Z</SubmittedAt>
   </ChangeInfo>
   <DelegationSet>
      <NameServers>
         <NameServer>ns-01.awsdns-00.com</NameServer>
         <NameServer>ns-500.awsdns-11.net</NameServer>
         <NameServer>ns-1112.awsdns-31.org</NameServer>
         <NameServer>ns-1600.awsdns-27.co.uk</NameServer>
      </NameServers>
   </DelegationSet>
</CreateHostedZoneResponse>
EOF

