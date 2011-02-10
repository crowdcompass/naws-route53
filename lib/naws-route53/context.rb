require 'naws-route53'
require 'naws/context'

class Naws::Route53::Context < Naws::Context
  
  BASE_URI = URI.parse("https://route53.amazonaws.com/2010-10-01").freeze
  XMLNS = "https://route53.amazonaws.com/doc/2010-10-01/".freeze

  def initialize(options = {})
    self.uri = BASE_URI.dup
    self.xmlns = XMLNS
    super
  end

end
