require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'naws-route53'
require 'naws/net_http_transport'

REAL_AWS_ID = ENV["TEST_AWS_ID"]
REAL_AWS_KEY = ENV["TEST_AWS_KEY"]

if REAL_AWS_ID.nil?
  raise "You need to set the TEST_AWS_ID and TEST_AWS_KEY environment variables"
end

## NOTE: you need to use an actual zone to test. That's why there's nothing here at the moment.
## Amazon says in their docs that they'll kick you off the service if you create a zone for a domain you don't own.

describe Naws::Route53, "when used against the server" do
 
  before do
    @cx = Naws::Route53::Context.new(:access_key_id => REAL_AWS_ID, :secret_access_key => REAL_AWS_KEY, :transport => :net_http)
  end

  it "should successfully create zones" do
    pending
  end

end
