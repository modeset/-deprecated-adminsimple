require 'singleton'

module Adminsimple
  class Configuration
    include Singleton

    cattr_accessor :theme, :layout, :parent_controller, :app_css_overrides, :app_js_overrides, :admin_model

    @@theme = :dark
    @@layout = [:user_nav, :main_nav, :content]
    @@parent_controller = 'ActionController::Base'
    @app_css_overrides = nil
    @app_js_overrides = nil
  end

  mattr_accessor :configuration
  @@configuration = Configuration

  def self.setup
    yield @@configuration
  end
end
