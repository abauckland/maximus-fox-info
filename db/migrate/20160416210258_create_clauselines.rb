class CreateClauselines < ActiveRecord::Migration
  def change
    create_table :clauselines do |t|
      t.integer :subclause_id
      t.integer :clauseline
      t.integer :linetype_id
      t.string :txt_id

      t.timestamps
    end
    
    add_index :clauselines, :subclause_id, name: "SUBCLAUSE", unique: true, using: :btree

  end
end
