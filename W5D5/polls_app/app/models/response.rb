# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  answer_choice_id :integer          not null
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord
    validate :respondent_is_author?
    validate :respondent_already_answered? 

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :AnswerChoice 
    
    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User 

    has_one :question,
        through: :answer_choice,
        source: :question

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end

    def respondent_already_answered?
      errors.add(:duplicate, "Respondent has already responded") if self.sibling_responses.find_by(user_id: self.user_id)
    end

    def respondent_is_author?
        errors.add(:fraud, "Respondent is the author") if self.user_id == self.question.author.id
    end
    
end
