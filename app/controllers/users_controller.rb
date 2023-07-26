class UsersController < ApplicationController
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


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
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
