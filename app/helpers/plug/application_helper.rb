# frozen_string_literal: true

module Plug
  module ApplicationHelper
    def asset_tags
      asset_source = defined?(ViteRuby) ? :vite : :other

      case asset_source
      when :vite
        vite_javascript_tag 'entrypoints/plug'
      else
        raise 'Plug does not support asset pipelines anymore. Use Vite.js instead.'
      end
    end
  end
end
