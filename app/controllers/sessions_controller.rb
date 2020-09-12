class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    # user = User.from_omniauth(env["omniauth.auth"]
    # session[:user_id] = user.id
    # redirect_to home_path
    if auth_hash = request.env["omniauth.auth"]
        user = User.find_or_create_by_omniauth(auth_hash)
        session[:user_id] = user.id
        redirect_to home_path
    else
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to home_path
      else
        flash[:alert] = "The email or password provided is incorrect"
        redirect_to login_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def create_oauth
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    session[:user_id] = @user.id
 
    render 'users/home'
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end
