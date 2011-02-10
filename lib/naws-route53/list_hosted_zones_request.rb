require 'naws/get_request'
require 'naws-route53/list_hosted_zones_response'

class Naws::Route53::ListHostedZonesRequest < Naws::GetRequest
  PATH = "/hostedzone"
  RESPONSE = Naws::Route53::ListHostedZonesResponse
end
