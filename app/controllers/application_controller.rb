# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  
  include SessionsHelper
  include AdminsHelper
  

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    if Current.user.nil?
      redirect_to sign_in_path,
                  flash: { danger: 'You must be signed in' }
    end
  end

  def require_admin
    unless Current.user.try(:is_admin?)
      redirect_to root_path,
                  flash: { danger: 'You are not authorized to perform this action' }
    end
  end
end
