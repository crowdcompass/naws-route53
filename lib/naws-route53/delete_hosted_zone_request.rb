require 'naws/request'
require 'naws-route53/delete_hosted_zone_response'

class Naws::Route53::DeleteHostedZoneRequest < Naws::Request
  METHOD = 'DELETE'
  PATH = "/hostedzone/:zone_id"
  RESPONSE = Naws::Route53::DeleteHostedZoneResponse
end
