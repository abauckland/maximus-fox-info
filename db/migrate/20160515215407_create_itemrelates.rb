class CreateItemrelates < ActiveRecord::Migration
  def change
    create_table :itemrelates do |t|
      t.integer :item_id
      t.integer :relation

      t.timestamps
    end

    add_index :itemrelates, :item_id, name: "ITEM", using: :btree

  end
end
