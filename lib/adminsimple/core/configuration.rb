require 'singleton'

module Adminsimple
  class Configuration
    include Singleton

    cattr_accessor :themes,
                   :layout,
                   :devise_model,
                   :devise_options,
                   :parent_controller,
                   :app_css_overrides,
                   :app_js_overrides

    @@theme = :light
    @@layout = [:header, :search, :user_nav, :main_nav, :content]
    @@devise_model = :admin
    @@devise_options = {controllers: {}} # controllers: {omniauth_callbacks: 'adminsimple/devise/omniauth_callbacks'}
    @@parent_controller = 'ActionController::Base'
  end

  mattr_accessor :configuration
  @@configuration = Configuration

  def self.setup
    yield @@configuration
  end
end
