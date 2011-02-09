require 'naws-route53/create_hosted_zone_response'

class Naws::Route53::CreateHostedZoneRequest < Naws::XmlRestRequest
  PATH = "/hostedzone"
  METHOD = "POST"
  RESPONSE = Naws::Route53::CreateHostedZoneResponse

  def xml(x)
    x.CreateHostedZoneRequest(:xmlns => @context.xmlns) do
      x.Name @params[:name]
      x.CallerReference @params[:caller_reference]
      if @params.has_key?(:comment)
        x.HostedZoneConfig do
          x.Comment @params[:comment]
        end
      end
    end
  end
end
