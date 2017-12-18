require 'plug/engine'
require 'plug/configuration'
require 'plug/constraint'

module Plug
  extend self
  extend Configuration

  # 
  # [enabled? returns true of false]
  # @param arg [String, Symbol] The slug or name of the Feature
  # 
  # @return [Boolean] true - feature found and enabled | true - feature not found (We don't want to block) | false - feature was set to disabled
  def enabled?(arg)
    arg = arg.to_s if arg.is_a? Symbol
    feature = Plug::Feature.slug_and_name(arg).first

    return true unless feature
    return feature.enabled?
  rescue
    return true
  end
end
