class UsersController < ApplicationController
    def index
    
        if params.has_key?("username")
            @users = User.where("username iLIKE ?", "%#{params["username"]}%")
        else 
            @users = User.all
        end

        render json: @users
    end

   def create
    user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: 422
        end 
    end

    def destroy
        @user = User.find(params[:id])

        @user.destroy 

        redirect_to users_url
    end

    def collection 
        if params.has_key?(:collection_name)
            collection = User.select("artworks.*").joins(:collection_pieces).where("users.id = ? AND collections.collection_name = ?", params[:id], params[:collection_name])
        else
            collection = User.select("collections.*").joins(:collections).where("users.id = ?", params[:id])
        end
        render json: collection 
    end


    private 

    def user_params
        params.require(:user).permit(:username)
    end 
end

