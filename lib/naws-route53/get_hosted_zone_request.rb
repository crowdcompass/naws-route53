require 'naws/get_request'
require 'naws-route53/get_hosted_zone_response'

class Naws::Route53::GetHostedZoneRequest < Naws::GetRequest
  PATH = "/hostedzone"
  RESPONSE = Naws::Route53::GetHostedZoneResponse
end
