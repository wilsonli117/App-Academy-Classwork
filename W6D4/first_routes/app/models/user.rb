# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord 
    validates :username, uniqueness: true, presence: true

    has_many :artworks,
        foreign_key: :artist_id,
        dependent: :destroy 

    has_many :artwork_shares, 
        foreign_key: :viewer_id, 
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_artworks, 
        through: :artwork_shares, 
        source: :artwork
    
    has_many :comments, 
        foreign_key: :user_id,
        dependent: :destroy

    has_many :likes, 
        foreign_key: :user_id

    has_many :liked_artworks, 
        through: :likes, 
        source: :likeable, source_type: :Artwork
    
     has_many :liked_comments, 
        through: :likes, 
        source: :likeable, source_type: :Comment

    has_many :collections, 
        foreign_key: :user_id 
    
    has_many :collection_pieces, 
        through: :collections,
        source: :artworks

    
    
end
