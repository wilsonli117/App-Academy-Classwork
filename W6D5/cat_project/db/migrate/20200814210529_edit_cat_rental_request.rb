class EditCatRentalRequest < ActiveRecord::Migration[5.2]
  def change
    change_column_default :cat_rental_requests, :status, 'PENDING'
  end
end
