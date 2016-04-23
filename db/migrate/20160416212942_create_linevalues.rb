class CreateLinevalues < ActiveRecord::Migration
  def change
    create_table :linevalues do |t|
      t.integer :standarditem_id
      t.string :text

      t.timestamps
    end
  end
end
