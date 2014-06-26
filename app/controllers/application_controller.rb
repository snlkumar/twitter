class ApplicationController < ActionController::Base
  protect_from_forgery
  def login_required
    unless current_user
      redirect_to new_user_session_path
    end
  end
  def all_user
    @all_users=User.all-[current_user]
  end
end
