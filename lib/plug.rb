require 'plug/engine'

module Plug
  extend self

  def enabled?(arg)
    arg = arg.to_s if arg.is_a? Symbol
    feature = Plug::Feature.slug_and_name(arg).first

    return false unless feature
    return feature.enabled?
  end
end
