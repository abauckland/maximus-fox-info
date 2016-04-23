class CreateCharacs < ActiveRecord::Migration
  def change
    create_table :characs do |t|
      t.integer :instance_id
      t.integer :perform_id

      t.timestamps
    end

    add_index :characs, :instance_id, name: "INSTANCE", using: :btree
    add_index :characs, :perform_id, name: "PERFORM", using: :btree

  end
end
