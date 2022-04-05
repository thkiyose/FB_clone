module SessionsHelper  
  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def can_if_logged_in
    redirect_to new_session_path unless current_user
  end

  def can_if_not_logged_in
    redirect_to user_path(current_user.id) if current_user
  end
end
