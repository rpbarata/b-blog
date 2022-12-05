# frozen_string_literal: true

class Authors::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  def create
    params[:user] = params[:user]&.merge(type: "Author")
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type, :first_name, :last_name, :username])
  end
end
