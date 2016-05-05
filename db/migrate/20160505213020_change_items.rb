class ChangeItems < ActiveRecord::Migration
  def change
    remove_column :items, :verions_id, :integer
    add_column :items, :version_id, :integer
  end
end
