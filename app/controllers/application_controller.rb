class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  around_filter :set_time_zone
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_last_seen_at, if: proc { user_signed_in? }


  private

  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.now)
  end

  protected

  def set_locale
    I18n.locale = params[:locale] # использование параметра запроса URL для установки локали (т.е. http://example.com/books?locale=pt)
    I18n.locale ||= current_user.try(:locale) # пользователбское предпочтение локали через интерфейс приложения, хранится в базе данных
    I18n.locale ||= extract_locale_from_accept_language_header # Определение локали из языка заголовка
    I18n.locale ||= I18n.default_locale
  end

  def set_time_zone(&block)
    time_zone = params[:time_zone] || current_user.try(:time_zone) || 'Kyiv'
    Time.use_zone(time_zone, &block)
  end

  def extract_locale_from_accept_language_header # Определение локали из языка заголовка
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache])
  end

end
