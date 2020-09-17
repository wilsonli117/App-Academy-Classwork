class UsersController < ApplicationController

    def index
        render :index
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            #login_in!(@user) 
            redirect_to users_url #this should be user_url(@user) aka show page
        else 
            flash.now[:errors] = @user.errors.full_messages
            render :new, status: 422
        end
    end


    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
