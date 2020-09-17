# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    
    # def valid_email?(self.email)
    #     # uppercase and lowercase Latin letters A to Z and a to z
    #     # digits 0 to 9
    #     # printable characters !#$%&'*+-/=?^_`{|}~

        
    # end
end
