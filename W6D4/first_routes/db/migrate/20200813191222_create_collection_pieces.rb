class CreateCollectionPieces < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_pieces do |t|
      t.integer :collection_id, null: false 
      t.integer :artwork_id, null: false 
      t.timestamps 
    end

    remove_index :collections, [:collection_name, :artwork_id, :user_id]
    remove_column :collections, :artwork_id
  end
end





  

