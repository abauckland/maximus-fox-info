class ChangeProducts < ActiveRecord::Migration
  def change
    add_column :products, :company_id, :integer
    add_column :products, :range_id, :integer
    add_column :products, :ref, :string
    add_column :products, :name, :string

    add_index :products, :item_id, name: "ITEMS", using: :btree
    add_index :products, :company_id, name: "COMPANIES", using: :btree
    add_index :products, :range_id, name: "RANGES", using: :btree

  end
end
