require 'naws-route53/create_hosted_zone_response'

class Naws::Route53::CreateHostedZoneRequest < Naws::Request
  PATH = "/hostedzone"
  METHOD = "POST"
  RESPONSE = Naws::Route53::CreateHostedZoneResponse
end
