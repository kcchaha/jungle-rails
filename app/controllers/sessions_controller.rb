class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = authenticate_with_credentials(params[:email], params[:password])
    
    if @user
      session[:user_id] = @user.id
      redirect_to '/'
    else
 
    flash.now[:error] = 'Invalid email/password combination'
    render '/login'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
