class CreateItemsubclauses < ActiveRecord::Migration
  def change
    create_table :itemsubclauses do |t|
      t.integer :subclause_id
      t.integer :item_id

      t.timestamps null: false
    end
    
    add_index :itemsubclauses, :item_id, name: "ITEM", using: :btree 
    add_index :itemsubclauses, :subclause_id, name: "SUBCLAUSE", using: :btree
    
  end
end
