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

  alias collection_items hosted_zones

  def is_truncated?
    xpath("//IsTruncated") == "true"
  end

  def next_item_offset
    { :Marker => xpath("//NextMarker") }
  end

end
