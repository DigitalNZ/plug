# frozen_string_literal: true

module Plug
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def copy_initializer_file
      copy_file 'plug.rb', 'config/initializers/plug.rb'
    end

    def mount_engine
      inject_into_file('config/routes.rb', "\n  mount Plug::Engine => '/plug', as: 'plug'\n\n", before: /^end/)
    end

    def setup_vite_assets
      copy_file 'plug.vite.js', 'app/frontend/entrypoints/plug.js'
    end

    def add_plug_package
      package_json_path = 'package.json'

      if File.exist?(package_json_path)
        package_json = JSON.parse(File.read(package_json_path))
        package_json['dependencies'] ||= {}
        package_json['dependencies']['@digitalnz/plug'] ||= "^#{Plug::VERSION}"

        File.write(package_json_path, JSON.pretty_generate(package_json) + "\n")
      else
        say 'package.json not found. Please ensure you are running this generator in the root directory of your Rails project.', :red
      end
    end
  end
end
