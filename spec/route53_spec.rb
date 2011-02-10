require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'naws-route53'
require 'naws/dummy_transport'

describe Naws::Route53 do

  it "should create requests through a context" do
    @cx = Naws::Route53::Context.new(:access_key_id => AWS_ID, :secret_access_key => AWS_KEY, :transport => :dummy)
    req1 = @cx.request :create_hosted_zone, :name => "crowdcompass.com", :caller_reference => "crowdcompass.com"
    req2 = Naws::Route53::CreateHostedZoneRequest.new(@cx, :name => "crowdcompass.com", :caller_reference => "crowdcompass.com")
    req1.to_xml.should == req2.to_xml
    req1.method.should == "POST"
    req1.headers.should == req2.headers
    req1.headers["X-Amzn-Authorization"].should match(/^AWS3-HTTPS/)
    req1.headers["Content-Type"].should == "text/xml"
    req1.uri.path.should == "/2010-10-01/hostedzone"
    req1.to_xml.should match(/<Name>/)
    req1.to_xml.should match("crowdcompass.com")
    resp1 = req1.execute
    resp2 = @cx.execute_request(req2)
    resp1.should be_kind_of(Naws::Route53::CreateHostedZoneResponse)
  end

  it "should parse responses" do
    resp = Naws::Route53::CreateHostedZoneResponse.new(:status => 201, :body => CREATE_HOSTED_ZONE_RESPONSE_XML, :headers => {})
    # We extract out the more significant fields for easy access. The rest are available
    # by XPath.
    resp.change_id.should == "/change/C1PA6795UKMFR9"
    resp.zone_id.should == "/hostedzone/Z1PA6795UKMFR9"
    resp.status.should == "PENDING"
    resp.name_servers.should have(4).items
    resp.name_servers.should include("ns-1112.awsdns-31.org")
  end

  it "should pass requests through the transport to be executed" do
    dummy = Naws::DummyTransport.new({
      "POST /2010-10-01/hostedzone" => {
        :status => 201, :body => CREATE_HOSTED_ZONE_RESPONSE_XML
      }
    })
    cx = Naws::Route53::Context.new(:access_key_id => AWS_ID, :secret_access_key => AWS_KEY, :transport => dummy)
    resp = cx.execute :create_hosted_zone, :name => "crowdcompass.com", :caller_reference => "crowdcompass.com"
    resp.change_id.should == "/change/C1PA6795UKMFR9"
  end
end
