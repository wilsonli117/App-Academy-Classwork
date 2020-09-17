# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    COLORS = ['black', 'white', 'grey', 'brown', 'gold', 'multicolor']

    validates :color, inclusion: { in: COLORS }
    validates :birth_date, :color, :name, :sex, presence: true

    has_many :cat_rental_requests, 
        foreign_key: :cat_id,
        dependent: :destroy


    def age
        Date.today.year - self.birth_date.year
    end

end
