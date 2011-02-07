# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "naws-route53/version"

Gem::Specification.new do |s|
  s.name        = "naws-route53"
  s.version     = Naws::Route53::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matthew Boeh"]
  s.email       = ["matt@crowdcompass.com"]
  s.homepage    = "http://rubygems.org/gems/naws-route53"
  s.summary     = %q{A flexible implementation of the Amazon Route 53 API}
  s.description = %q{A flexible implementation of the Amazon Route 53 API}
  
  #s.add_dependency('naws')
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
