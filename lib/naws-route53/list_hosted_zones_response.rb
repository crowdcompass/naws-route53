require 'naws/xml_response'

class Naws::Route53::ListHostedZonesResponse < Naws::XmlResponse
  
  def hosted_zones
    xpath_collection("//HostedZones/HostedZone", {
      "Id" => :id,
      "Name" => :name,
      "CallerReference" => :caller_reference,
      "Config/Comment" => :comment,
    }).each do |h|
      h[:id] = h[:id].split("/").last
    end
  end

end
