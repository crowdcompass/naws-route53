require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'naws-route53'

AWS_ID = "BogusAWSID"
AWS_KEY = "/Ml61L9VxlzloZ091/lkqVV5X1/YvaJtI9hW4Wr9"

describe Naws::Route53 do

  it "should create requests through a context" do
    @cx = Naws::Route53::Context.new(:access_key_id => AWS_ID, :secret_access_key => AWS_KEY, :transport => :net_http)
    req1 = @cx.request :create_hosted_zone, :name => "crowdcompass.com", :caller_reference => "crowdcompass.com"
    req2 = Naws::Route53::CreateHostedZoneRequest.new(@cx)
    req1.to_xml.should == req2.to_xml
    req1.method.should == "POST"
    req1.headers.should == req2.headers
    req1.headers["X-Amzn-Authorization"].should match(/^AWS3-HTTPS/)
    req1.uri.path.should == "/2010-10-01/hostedzone"
    resp1 = req1.execute
    resp2 = @cx.execute_request(req2)
    resp1.should be_kind_of(Naws::Route53::CreateHostedZoneResponse)
  end

end
