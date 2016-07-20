class RenameColumnFromUser < ActiveRecord::Migration
  def change
    rename_column :users, :name, :username
  end
end
