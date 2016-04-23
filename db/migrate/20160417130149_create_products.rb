class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :item_id

      t.timestamps
    end
  end
end
