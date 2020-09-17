# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  artwork_id :integer          not null
#  body       :string           not null
#
class Comment < ApplicationRecord

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User
        
    belongs_to :artwork, 
        foreign_key: :artwork_id

    has_many :likes, as: :likeable

    has_many :likers, 
        through: :likes, 
        source: :user 


end
