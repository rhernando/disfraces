class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :disfraz_id, :integer

    add_index :users, :username, :unique => true
  end


end
