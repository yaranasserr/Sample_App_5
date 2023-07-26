class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      forwarding_url = session[:forwarding_url]
      reset_session
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to forwarding_url || user


    else
      flash.now[:danger] = 'Invalid email/password combination'
      render'new',status: :unprocessable_entity
    end

    def current_user
      if session[:user_id]
       @current_user ||= User.find_by(id: session[:user_id])
     end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url ,status: :see_other
  end

end
