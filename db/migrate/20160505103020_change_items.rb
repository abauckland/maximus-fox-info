class ChangeItems < ActiveRecord::Migration
  def change
    add_column :items, :verions_id, :integer
  end
end
