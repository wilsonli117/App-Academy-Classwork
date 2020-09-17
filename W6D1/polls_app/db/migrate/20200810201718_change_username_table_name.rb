class ChangeUsernameTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :usernames, :users
  end
end
