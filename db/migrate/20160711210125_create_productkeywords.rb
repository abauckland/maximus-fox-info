class CreateProductkeywords < ActiveRecord::Migration
  def change
    create_table :productkeywords do |t|
      t.integer :product_id
      t.integer :keyword_id

      t.timestamps
    end
  end
end
