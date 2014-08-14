class Adminsimple::Devise::SessionsController < Devise::SessionsController

  layout 'adminsimple/devise'

  def after_sign_in_path_for(resource)
    if resource.class.name == Adminsimple.configuration.admin_model.to_s.camelize
      adminsimple.root_path
    else
      root_path
    end
  end

end
