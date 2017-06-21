class SessionsController < ApplicationController

  before_action :require_logout

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      flash.now[:errors] = ["invalid username and/or password"]
      render :new
    else
      @user.reset_session_token!
      login_user!(@user)
      redirect_to cats_url
    end
  end

  def destroy
    if current_user
      logout
    end
    redirect_to cats_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
