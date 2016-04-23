class CreateItemitems < ActiveRecord::Migration
  def change
    create_table :itemitems do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end
end
