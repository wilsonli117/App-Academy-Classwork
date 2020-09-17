# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  poll_id    :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
    validates :body, presence: true

    has_many :answer_choices,
        foreign_key: :question_id

    belongs_to :poll,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: :Poll

    has_many :responses,
        through: :answer_choices,
        source: :responses

    has_one :author,
        through: :poll,
        source: :author

    def results
        results = self.answer_choices
        .left_outer_joins(:responses)
        .select("body, COUNT(user_id) AS response_count")
        .group("answer_choices.id")
    

        count = {}
        
        results.each do |result|
            count[result.body] = result.response_count
        end

        count 
    end
end
