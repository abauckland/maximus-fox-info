class CreateSubclauses < ActiveRecord::Migration
  def change
    create_table :subclauses do |t|
      t.integer :guide_id
      t.string :title
      t.string :descript1
      t.string :descript2
      t.integer :clausetype_id

      t.timestamps null: false
    end
    
    add_index :subclauses, :title, name: "TITLE", unique: true, using: :btree
    add_index :subclauses, :clausetype_id, name: "CLAUSETYPE", using: :btree     
    
  end
end
