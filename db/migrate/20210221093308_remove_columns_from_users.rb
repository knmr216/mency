class RemoveColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :age_id, :integer
    remove_column :users, :skin_quality_id, :integer
  end
end
