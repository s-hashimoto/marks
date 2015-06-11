class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  after_filter :store_location

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nickname, :introduction, :current_password, :password_confirmation, :password, :img, :email) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nickname, :introduction, :current_password, :password_confirmation, :password, :img, :email) }
  end

  def store_location
   # 今回の場合は、 /users/sign_in , /users/sign_up, /users/password   にアクセスしたとき、ajaxでのやりとりはsessionには保存しない。
      if (request.fullpath != "/users/sign_in" && \
          request.fullpath != "/users/sign_up" && \
          request.fullpath != "/users/password" && \
          !request.xhr?) # don't store ajax calls
        session[:previous_url] = request.fullpath
      end
  end

  def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
  end

end
