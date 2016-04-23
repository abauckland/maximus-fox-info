class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :text
      t.integer :preamble_id
      t.integer :postscript_id

      t.timestamps null: false
    end
  end
end
