class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required
  around_action :switch_locale

  # default from: 'app@example.com'
  # layout 'mailer'
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to logins_url unless current_user
  end

  def switch_locale(&action)
    locale = current_user.try(:locale) || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
