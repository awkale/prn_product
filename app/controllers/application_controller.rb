class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  # after_action :verify_authorized, except: [:index]

  # Includes Authorization mechanism
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :ensure_domain

  def ensure_domain
    if request.env['HTTP_HOST'] == 'prn-product.herokuapp.com'
      redirect_to "https://distribution.prnewswire.com#{request.env['REQUEST_PATH']}", status: 301
    end
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:email, :password) }
  end

  private

  def user_not_authorized
    flash[:alert] = 'Access denied.'
    redirect_to (request.referrer || root_path)
  end
end
