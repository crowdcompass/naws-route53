require 'naws/get_request'
require 'naws-route53/list_resource_record_sets_response'

class Naws::Route53::ListResourceRecordSetsRequest < Naws::GetRequest
  PATH = "/hostedzone/:zone_id/rrset"
  RESPONSE = Naws::Route53::ListResourceRecordSetsResponse
end
