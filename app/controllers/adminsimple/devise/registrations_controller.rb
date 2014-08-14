class Adminsimple::Devise::RegistrationsController < Devise::RegistrationsController

  layout :layout

  before_filter :authenticate!, :add_crumbs

  private

  def authenticate!
    self.send("authenticate_#{Adminsimple.configuration.admin_model}!")
  end

  def layout
    'adminsimple/application'
  end

  def self.mimes_for_respond_to
    {html: {}}
  end

  def add_crumbs
    add_crumb 'Dashboard', adminsimple.root_path
  end

end
