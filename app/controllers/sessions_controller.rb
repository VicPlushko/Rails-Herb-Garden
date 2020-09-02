class SessionsController < ApplicationController

    def new
    end

    def create
        binding.pry
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to controller: 'users', action: 'home'
        else 
            flash[:alert] = "The email or password provided is incorrect"
            redirect_to login_path
        end 

    end 

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

end
