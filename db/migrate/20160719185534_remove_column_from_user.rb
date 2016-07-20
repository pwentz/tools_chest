class RemoveColumnFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    rename_column :users, :encrypted_password, :password
  end
end
