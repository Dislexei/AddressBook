class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      token = (0...8).map { (65 + rand(26)).chr }.join
      user.update(token: token)
      session[:user_id] = user.id
      redirect_to root_path
    else 
      redirect_to login_url, alert: "Invalid user name and/or password"
    end
  end


  def destroy
    # user.token = ''
    user = User.find_by(id: session[:user_id])
    user.update(token: nil)
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end
