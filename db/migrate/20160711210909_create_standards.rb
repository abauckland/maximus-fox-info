class CreateStandards < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :ref
      t.string :title
      t.string :year

      t.timestamps
    end
  end
end
