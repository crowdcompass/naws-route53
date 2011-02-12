require 'naws/xml_response'
require 'naws-route53/common/change'

class Naws::Route53::ChangeResourceRecordSetsResponse < Naws::XmlResponse
  include Naws::Route53::Common::Change
end
