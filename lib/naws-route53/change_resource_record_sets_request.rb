require 'naws/xml_rest_request'
require 'naws-route53/change_resource_record_sets_response'

class Naws::Route53::ChangeResourceRecordSetsRequest < Naws::XmlRestRequest
  PATH = "/hostedzone/:zone_id/rrset"
  METHOD = "POST"
  RESPONSE = Naws::Route53::ChangeResourceRecordSetsResponse

  def xml(x)
    x.ChangeResourceRecordSetsRequest(:xmlns => @context.xmlns) do
      x.ChangeBatch do
        x.Comment(@params[:comment]) if @params[:comment]
        x.Changes do
          @params[:changes].each do |change|
            x.Change do
              x.Action change[:action]
              x.ResourceRecordSet do
                x.Name change[:name]
                x.Type change[:type]
                x.TTL change[:ttl]
                x.ResourceRecords do
                  change[:records].each do |record|
                    x.ResourceRecord do
                      x.Value record
                    end
                  end
                end
              end
            end
          end             # XML!
        end
      end
    end
  end
end

