class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :collection_name, null: false 
      t.integer :artwork_id, null: false 
      t.integer :user_id, null: false 
      t.timestamps
    end

    add_index :collections, [:collection_name, :artwork_id, :user_id], unique: true
    add_index :collections, :artwork_id
    add_index :collections, :user_id
  end
end
