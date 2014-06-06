Adminsimple.setup do |config|

  # Set the available themes
  # dark, light, and simple are available as defaults
  config.theme = :simple

  # Set the CSS overrides
  # A path to a file in your project to override styles
  #config.app_css_overrides = 'admin'

  # Set the JS overrides
  # A path to a file in your project to override javascripts
  #config.app_js_overrides = 'admin'

  # allows the ability to configure the class used for administration
  config.admin_model = :admin

  # Specify the layout order
  # You can reorder the default, include additional layout modules or remove unused/unsupported ones.
  config.layout  = [:user_nav, :main_nav, :content]

  # Parent controller
  # You can set the parent controller to something if ActionController::Base doesn't do everything you want.
  config.parent_controller = 'ActionController::Base'

  Navigasmic.setup do |c|
    c.semantic_navigation :adminsimple_main_nav do |n|
      n.item n.t('adminsimple.main_nav.dashboard'), proc{ adminsimple.root_path }, icon: 'home'
      #n.item n.t('adminsimple.main_nav.clients'), proc{ clients_path }, icon: 'globe', highlights_on: [{controller: 'admin/clients'}]
      if Rails.env.development?
        n.group n.t('adminsimple.main_nav.style_guide'), icon: 'info-circle', label: 5 do
          n.item n.t('adminsimple.main_nav.forms'), proc{ adminsimple.styleguide_path('forms') }, icon: 'th-list'
          n.item n.t('adminsimple.main_nav.tables'), proc{ adminsimple.styleguide_path('tables') }, icon: 'th'
          n.item n.t('adminsimple.main_nav.elements'), proc{ adminsimple.styleguide_path('elements') }, icon: 'briefcase'
          n.item n.t('adminsimple.main_nav.messages'), proc{ adminsimple.styleguide_path('messages') }, icon: 'exclamation-triangle'
          n.item n.t('adminsimple.main_nav.icons'), proc{ adminsimple.styleguide_path('icons') }, icon: 'list-ul'
        end
      end
    end

    c.semantic_navigation :adminsimple_user_nav do |n|
      n.item n.t('adminsimple.user_nav.profile'), proc{ main_app.send("edit_#{Adminsimple.configuration.admin_model}_registration_path")}, class: 'btn', icon: 'user', link_html: { rel: 'modal' }
      n.item n.t('adminsimple.user_nav.sign_out'), proc{ main_app.send("destroy_#{Adminsimple.configuration.admin_model}_session_path")}, class: 'btn', icon: 'reply'
    end
  end

  SimpleForm.setup do |c|
    c.boolean_style = :nested
    c.button_class = 'btn btn-primary'

    c.wrappers :bootstrap3, tag: 'div', class: 'form-group', error_class: 'has-error',
      defaults: {
        input_html: { class: 'default_class' }
      } do |b|

      b.use :html5
      b.use :min_max
      b.use :maxlength
      b.use :placeholder

      b.optional :pattern
      b.optional :readonly

      b.use :label_input
      b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      b.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }

    end

    c.wrappers :bootstrap3_horizontal, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|

      b.use :html5
      b.use :min_max
      b.use :maxlength
      b.use :placeholder

      b.optional :pattern
      b.optional :readonly

      b.use :label, wrap_with: { class: 'col-lg-3 col-md-3' }
      b.wrapper :right_column, tag: :div, class: 'col-lg-9 col-md-9' do |component|
        component.use :input
      end

      b.use :hint,  wrap_with: { tag: 'span', class: 'help-block col-lg-offset-3 col-lg-9 col-md-offset-3 col-md-9' }
      b.use :error, wrap_with: { tag: 'span', class: 'help-block has-error col-lg-offset-3 col-lg-9 col-md-offset-3 col-md-9' }
    end

    c.wrappers :group, tag: 'div', class: 'form-group', error_class: 'has-error',
      defaults: {
        input_html: { class: 'default-class '}
      }  do |b|

      b.use :html5
      b.use :min_max
      b.use :maxlength
      b.use :placeholder

      b.optional :pattern
      b.optional :readonly

      b.use :label, wrap_with: { class: 'col-lg-3 col-md-3' }
      b.use :input, wrap_with: { class: 'input-group' }
      b.use :hint,  wrap_with: { tag: 'span', class: 'help-block col-lg-offset-3 col-lg-9 col-md-offset-3 col-md-9' }
      b.use :error, wrap_with: { tag: 'span', class: 'help-block has-error col-lg-offset-3 col-lg-9 col-md-offset-3 col-md-9' }
    end

    c.wrappers :checkbox_horizontal, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
      b.wrapper tag: 'div', class: 'col-lg-offset-3 col-lg-9 col-md-offset-3 col-md-9' do |ba|
        ba.use :label_input
      end
    end

    c.wrappers :checkbox, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
      b.wrapper tag: 'div' do |ba|
        ba.use :label_input
      end
    end

    c.default_wrapper = :bootstrap3_horizontal
  end
end
