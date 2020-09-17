class Collection < ApplicationRecord
    
    belongs_to :user,
        foreign_key: :user_id

    has_many :collection_pieces,
        foreign_key: :collection_id

    has_many :artworks, 
        through: :collection_pieces,
        source: :artwork 

end