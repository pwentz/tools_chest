class CreateTool < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
