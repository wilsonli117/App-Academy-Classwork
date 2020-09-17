class CollectionPiece < ApplicationRecord 
    
    belongs_to :collection,
        foreign_key: :collection_id 

    belongs_to :artwork, 
        foreign_key: :artwork_id 
    
end 

