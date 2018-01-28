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
  # @return [Boolean] true - Feature found and enabled | true - Feature not found (We don't want to block) | false - Feature was set to disabled
  def enabled?(arg)
    arg = arg.to_s if arg.is_a? Symbol
    feature = Plug::Feature.slug_and_name(arg).first

    return true unless feature
    return feature.enabled?
  rescue
    return true
  end

  # 
  # Returns true if Feature is disabled
  # @param arg [String] The slug or name of the Feature
  # 
  # @return [Boolean]
  def disabled?(arg)
    !enabled?(arg)
  end

  # 
  # Returns the notice of a given Feature
  # @param arg [String] The slug or name of the Feature
  # @param &block [Proc] The block of HTML/String for the notice
  # 
  # @return [String] The block of HTML/String with notice
  def notice(arg, &block)
    if disabled?(arg)
      feature = Plug::Feature.slug_and_name(arg).first

      return nil unless feature.notice.present?

      if block_given?
        yield(feature.notice) 
      else
        feature.notice
      end
    end
  end
end
