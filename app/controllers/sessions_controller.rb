class SessionsController < ApplicationController
  def new
  end
  def create
    render'new',status::unprocessable_entity
    end

  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     reset_session
  #     log_in user
  #     redirect_to user
  #   else
  #   # Create an error message.
  #     flash.now[:danger] = 'Invalid email/password combination'
  #     render 'new'
  #     end
  #   end
  # def current_user
  #     if session[:user_id]
  #     @current_user ||= User.find_by(id: session[:user_id])
  #     end
  # end

  # def logged_in?
  #   !current_user.nil?
  # end

  def destroy
  end

end
