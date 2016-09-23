class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :ensure_domain

  def ensure_domain
    if request.env['HTTP_HOST'] == 'prn-product.herokuapp.com'
      redirect_to "https://distribution.prnewswire.com#{request.env['REQUEST_PATH']}", status: 301
    end
  end
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:email, :password) }
  end

  private

  def user_not_authorized
    flash[:alert] = 'Access denised.'
    redirect_to (request.referrer || root_path)
  end
end
