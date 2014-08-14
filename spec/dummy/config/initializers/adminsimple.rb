Adminsimple.setup do |config|

  # Set the available themes
  # dark, light, and simple are available as defaults
  config.theme = :simple

  # Set the CSS overrides
  # A path to a file in your project to override styles
  # config.app_css_overrides = ''

  # Set the JS overrides
  # A path to a file in your project to override javascripts
  # config.app_js_overrides = ''

  # Specify the layout order
  # You can reorder the default, include additional layout modules or remove unused/unsupported ones.
  config.layout  = [:user_nav, :main_nav, :search, :content]

  # Specify the devise model
  # You can provide an alternate devise model if you're using something other than admin.
  config.devise_model = :admin

  # Parent controller
  # You can set the parent controller to something if ActionController::Base doesn't do everything you want.
  config.parent_controller = 'ActionController::Base'

  Devise.setup do |c|
    require 'devise/orm/active_record'

    #c.router_name = :adminsimple
    c.parent_controller = 'Adminsimple::ApplicationController'
    c.mailer_sender = "admin@adminsimple.com"
    c.case_insensitive_keys = [:email]
    c.strip_whitespace_keys = [:email]
    c.skip_session_storage = [:http_auth]
    c.stretches = Rails.env.test? ? 1 : 10
    c.http_authenticatable = true
    c.scoped_views = true
    c.reconfirmable = true
    c.reset_password_within = 6.hours
    c.sign_out_via = :get
  end

  Navigasmic.setup do |c|
    c.semantic_navigation :adminsimple_navigasmic_main_nav do |n|
      n.item n.t('adminsimple.main_nav.dashboard'), proc{ adminsimple.root_path }, icon: 'home'
      n.group n.t('adminsimple.main_nav.style_guide'), icon: 'info-sign', label: 1 do
        n.item n.t('adminsimple.main_nav.icons'), proc{ adminsimple.styleguide_path('icons') }, icon: 'list-ul'
      end
    end

    c.semantic_navigation :adminsimple_navigasmic_user_nav do |n|
      n.item n.t('adminsimple.user_nav.profile'), proc{ main_app.send("edit_#{Adminsimple.configuration.admin_model}_registration_path")}, class: 'btn', icon: 'user', link_html: { rel: 'modal' }
      n.item n.t('adminsimple.user_nav.sign_out'), proc{ main_app.send("destroy_#{Adminsimple.configuration.admin_model}_session_path")}, class: 'btn', icon: 'reply'
    end
  end

  SimpleForm.setup do |c|
    # There are more configuration options, but for brevity they're kept in a
    # different initializer -- which you can tweak here.
    c.default_wrapper = :bootstrap
    c.boolean_style = :nested
    c.button_class = 'btn'
    c.error_notification_tag = :div
    c.error_notification_class = 'alert alert-error'
    c.label_class = 'control-label'
    c.browser_validations = false
  end

end
