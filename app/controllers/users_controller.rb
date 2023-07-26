class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new', status: 422, status: :unprocessable_entity
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    # Handle a successful update.
    else
    render 'edit', status: 422, status: :unprocessable_entity
    end
    end



  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
# def some_action
#   # Your code logic here

#   # Assuming you have an object with errors, e.g., @model
#   @error_messages = render_to_string(partial: 'shared/error_messages', locals: { object: @model }, formats: [:html])

#   # Rest of your code logic
# end
# flash = { success: "It worked!", danger: "It failed." }
# => {:success=>"It worked!", danger: "It failed."}
# >> flash.each do |key, value|
# ?> puts "#{key}"
# ?> puts "#{value}"
