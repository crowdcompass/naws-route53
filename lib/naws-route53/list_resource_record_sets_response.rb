require 'naws/xml_response'

class Naws::Route53::ListResourceRecordSetsResponse < Naws::XmlResponse

  def resource_record_sets
    @resource_record_sets ||= xpath_collection("//ResourceRecordSets/ResourceRecordSet", {
      "Name" => :name,
      "Type" => :type,
      "TTL"  => :ttl,
      "ResourceRecords/ResourceRecord/Value" => :records
    }).each do |h|
      h[:records] = [h[:records]] unless h[:records].kind_of?(Array)
    end
  end

  alias collection_items resource_record_sets

  # These methods can be used for a shortcut if you want to just retrieve a single record.
  def first; resource_record_sets.first end
  def name; first[:name] end
  def type; first[:type] end
  def ttl; first[:ttl] end
  def records; first[:records] end
  
end
