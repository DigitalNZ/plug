module Plug
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_initializer_file
      copy_file 'plug.rb', 'config/initializers/plug.rb'
    end

    def mount_engine
      inject_into_file('config/routes.rb', "\n  mount Plug::Engine => '/plug', as: 'plug'\n\n", before: /^end/)
    end
  end
end
