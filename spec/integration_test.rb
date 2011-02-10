require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'naws-route53'
require 'naws/net_http_transport'

REAL_AWS_ID = ENV["TEST_AWS_ID"]
REAL_AWS_KEY = ENV["TEST_AWS_KEY"]

if REAL_AWS_ID.nil?
  raise "You need to set the TEST_AWS_ID and TEST_AWS_KEY environment variables"
end

describe Naws::Route53, "when used against the server" do
 
  before do
    @cx = Naws::Route53::Context.new(:access_key_id => REAL_AWS_ID, :secret_access_key => REAL_AWS_KEY, :transport => :net_http)
  end

  it "should successfully create zones" do
    #@cx.execute :create_hosted_zone, :name => "crowdcompass.com", :caller_reference => "crowdcompass.com"
    r = @cx.execute :list_hosted_zones
    p r
    p r.hosted_zones
    r = @cx.execute :get_hosted_zone, :zone_id => "/hostedzone/ZPPJKFJ5B07YQ"
    p r
  end

end
