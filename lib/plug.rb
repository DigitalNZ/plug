require 'plug/engine'
require 'plug/configuration'
require 'plug/constraint'

module Plug
  extend self
  extend Configuration

  def enabled?(arg)
    arg = arg.to_s if arg.is_a? Symbol
    feature = Plug::Feature.slug_and_name(arg).first

    return false unless feature
    return feature.enabled?
  end
end
