class CreateRanges < ActiveRecord::Migration
  def change
    create_table :Ranges do |t|
      t.string :name

      t.timestamps
    end
  end
end
