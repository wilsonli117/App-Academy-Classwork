class SessionsController < ApplicationController
    before_action :if_logged_in, only: [:new, :create]

    def new 
        render :new
    end

    def create
        @user = User.find_by_credentials( 
            params[:user][:username], params[:user][:password]
            )
        login_user!
    end

    def destroy

        current_user.reset_session_token!
        @current_user = nil
        session[:session_token] = nil
        redirect_to new_session_url

    end

end
