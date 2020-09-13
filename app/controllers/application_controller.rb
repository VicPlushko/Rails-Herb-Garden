class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    

    def home
    end

    private

    
      def logged_in?
        current_user != nil
      end
    
      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
    
      def require_login
        redirect_to "/" unless session.include? :user_id
      end

      def user_logged_in
        if !logged_in?
          redirect_to root_path
        end
      end
      helper_method :current_user, :user_logged_in
end
