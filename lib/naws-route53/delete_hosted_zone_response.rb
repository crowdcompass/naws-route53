require 'naws/xml_response'
require 'naws-route53/common/change'

class Naws::Route53::DeleteHostedZoneResponse < Naws::XmlResponse
  include Naws::Route53::Common::Change

  def zone_id
    xpath("//HostedZone/Id").split('/').last
  end

  def name
    xpath("//HostedZone/Name")
  end

  def caller_reference
    xpath("//HostedZone/CallerReference")
  end

  def comment
    xpath("//HostedZone/Config/Comment")
  end

  def name_servers
    xpath "//NameServers/NameServer"
  end

end
