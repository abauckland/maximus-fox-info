class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :guide_id

      t.timestamps null: false
    end
        
    add_index :items, :title, name: "TITLE", unique: true, using: :btree  
  end
end
