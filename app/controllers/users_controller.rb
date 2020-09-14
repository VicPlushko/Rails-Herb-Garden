class UsersController < ApplicationController

    def new
        @user = User.new
    end 

    def create
        # binding.pry
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to controller: 'users', action: 'home'
        else
            render 'new'
        end
     end

     def home
    
     end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
