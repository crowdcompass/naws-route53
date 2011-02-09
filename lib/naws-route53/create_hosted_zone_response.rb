require 'naws/xml_response'

class Naws::Route53::CreateHostedZoneResponse < Naws::XmlResponse

  def change_id
    xpath "//ChangeInfo/Id"
  end

  def zone_id
    xpath "//HostedZone/Id"
  end

  def status
    xpath "//ChangeInfo/Status"
  end

  def name_servers
    xpath "//NameServers/NameServer"
  end

end
