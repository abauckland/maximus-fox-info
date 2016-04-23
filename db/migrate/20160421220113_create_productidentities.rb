class CreateProductidentities < ActiveRecord::Migration
  def change
    create_table :productidentities do |t|
      t.integer :identity_id
      t.integer :product_id

      t.timestamps
    end

    add_index :productidentities, :identity_id, name: "IDENTITY", using: :btree
    add_index :productidentities, :product_id, name: "PRODUCT", using: :btree

  end
end
