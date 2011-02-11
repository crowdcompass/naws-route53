require 'naws/xml_response'

class Naws::Route53::ListResourceRecordSetsResponse < Naws::XmlResponse

  def resource_record_sets
    xpath_collection("//ResourceRecordSets/ResourceRecordSet", {
      "Name" => :name,
      "Type" => :type,
      "TTL"  => :ttl,
      "ResourceRecords/ResourceRecord/Value" => :records
    })
  end

end
