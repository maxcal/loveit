class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :deny_access!

  def deny_access!
    redirect_to new_user_session_path,
     status: :unauthorized,
     error: 'You are not authorized to perform this action.'
  end

  # hacky fix that makes Pundit 1.1 behave like the master
  def authorize(record, query = nil)
    super
    record
  end
end
