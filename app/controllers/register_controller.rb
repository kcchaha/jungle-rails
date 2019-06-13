class RegisterController < ApplicationController
  def index
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to 'root'
    else
      render 'register_index'
    end
  end

  private
  def user_params
    params.require(:user).permit(
    :first_name, 
    :last_name,
    :email_address,
    :password
    )
  end
end