# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord
    STATUS = ['PENDING','APPROVED','DENIED']
    validates :status, presence: true, inclusion: { in: STATUS }
    validates :start_date, :end_date, presence: true
    
    belongs_to :cat,
        foreign_key: :cat_id

    def overlapping_requests
       a =  CatRentalRequest
            .where("cat_id = ? AND start_date = ? " self.start_date, self.end_date )

       a.length == 0
    end
    
end
