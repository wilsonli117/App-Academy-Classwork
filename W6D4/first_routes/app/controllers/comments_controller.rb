class CommentsController < ApplicationController

    def create
     
        comment = Comment.new(comment_params)

        if comment.save
            render json: comment
        else 
            render json: comment.errors.full_messages, status: 422
        end

    end

    def destroy

        comment = Comment.find(params[:id])

        comment.destroy 

        render json: comment 
    end

    def index 
        # byebug
        if comment_params.has_key?(:user_id)
            comments = Comment.where("user_id = ?", comment_params[:user_id])
        elsif comment_params.has_key?(:artwork_id)
            comments = Comment.where("artwork_id = ?", comment_params[:artwork_id])
        end
        render json: comments 
    end



    private

    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id, :body)
    end
end
