class ChangeItemitems < ActiveRecord::Migration
  def change
    remove_column :itemitems, :parent_id, :integer
    remove_column :itemitems, :child_id, :integer

    add_column :itemitems, :itemrelate_id, :integer
    add_column :itemitems, :item_id, :integer

    add_index :itemitems, :itemrelate_id, name: "RELATE", using: :btree

  end
end
