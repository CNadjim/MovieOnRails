class MyDeviseController < ApplicationController
  layout "blank"

  before_action :configure_permitted_parameters

  def configure_permitted_parameters
    added_attrs = %i( username)
    devise_parameter_sanitizer.permit(:sign_up,keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end
end