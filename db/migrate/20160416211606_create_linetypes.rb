class CreateLinetypes < ActiveRecord::Migration
  def change
    create_table :linetypes do |t|
      t.integer :level
      t.boolean :txt
      t.boolean :input
      t.string :description

      t.timestamps
    end
  end
end
