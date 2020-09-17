class CollectionsController < ApplicationController

    def create
        collection = Collection.new(user_id: params[:id], collection_name: collection_params[:collection_name]) 

        if collection.save 
            render json: collection 
        else 
            render json: collection.errors.full_messages, status: 422
        end

    end

    def destroy 
        collection = Collection.find_by("collection_name = ? AND user_id = ?", collection_params[:collection_name], params[:id])
        # debugger 
        collection.destroy

        render json: collection
    end

    def update 
        collection = Collection.find_by("collection_name = ? AND user_id = ?", collection_params[:collection_name], params[:id])
            if collection_piece = CollectionPiece.find_by("collection_id = ? AND artwork_id = ?", collection.id, collection_params[:artwork_id])
                collection_piece.destroy
            else 
                collection_piece = CollectionPiece.new(collection_id: collection.id, artwork_id: collection_params[:artwork_id])
                collection_piece.save 
            end

        render json: collection_piece
    end


    private

    def collection_params
        params.require(:collection).permit(:user_id, :collection_name, :artwork_id)
    end

end