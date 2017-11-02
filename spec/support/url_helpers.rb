RSpec.configure do |config|
  config.before :each, type: :view do
    view.class.include Plug::Engine.routes.url_helpers
  end
end