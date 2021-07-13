# frozen_string_literal: true

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
    get_feature(arg).enabled?
  rescue StandardError
    true
  end

  #
  # Returns the notice of a given Feature
  # @param arg [String] The slug or name of the Feature
  # @param &block [Proc] The block of HTML/String for the notice
  #
  # @return [String] The block of HTML/String with notice
  def notice(arg, &block)
    feature = get_feature(arg)

    render_notice(feature.notice, &block) unless feature.enabled? || feature.notice.blank?
  rescue StandardError
    nil
  end

  private

  def get_feature(arg)
    arg = arg.to_s if arg.is_a? Symbol

    return Plug::Feature.slug_and_name(arg).first
  end

  def render_notice(notice, &block)
    return notice unless block_given?

    yield(notice)
  end
end
