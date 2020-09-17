class UpdateSchema < ActiveRecord::Migration[5.2]
  def change
    add_index :collection_pieces, :collection_id 
    add_index :collection_pieces, :artwork_id 
    add_index :collection_pieces, [:collection_id, :artwork_id], unique: true 
  end
end
