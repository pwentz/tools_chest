class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
