require 'naws/xml_response'

class Naws::Route53::ListHostedZonesResponse < Naws::XmlResponse
  
  # TODO: this needs to be structured somehow
  def hosted_zones
    xpath "//HostedZone/Name"
  end

end
