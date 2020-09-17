class LikesController < ApplicationController

    def create
        like = Like.new(like_params)

        if like.save
            render json: like 
        else 
            render json: like.errors.full_messages, status: 422
        end

    end

    def destroy
        like = Like.find(params[:id])

        like.destroy

        render json: like 
    end

    def user_index
       likes = Like.where("user_id = ?", params[:id])
       render json: likes 
    end

    def type_index 
        # debuggerd
        likes = Like.where("likeable_id = ? AND likeable_type = ?", params[:id], like_params[:likeable_type])
        render json: likes 
    end

    private 

    def like_params 
        params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
    end
end