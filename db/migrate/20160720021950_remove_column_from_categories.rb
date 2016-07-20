class RemoveColumnFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :tool_id, :string
  end
end
