class UsersController < ApplicationController

    def new
        @user = User.new
    end 

    def create
        # binding.pry
        @user = User.create(user_params)
        redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to controller: 'users', action: 'home'
     end

     def home
        @herbs = Herb.all.order('name ASC')
        @remedies = Remedy.all.order('title ASC')
     end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
