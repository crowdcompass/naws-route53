require 'naws'

module Naws
  module Route53
    module Common; end    
  end
end

require 'naws-route53/context'
require 'naws-route53/create_hosted_zone_request'
require 'naws-route53/list_hosted_zones_request'
require 'naws-route53/get_hosted_zone_request'
require 'naws-route53/delete_hosted_zone_request'
require 'naws-route53/list_resource_record_sets_request'
require 'naws-route53/change_resource_record_sets_request'
