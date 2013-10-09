class AddOauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, default: nil 
    add_column :users, :uid, :string, default: nil

    add_index :users, [:provider, :uid]
  end
end
