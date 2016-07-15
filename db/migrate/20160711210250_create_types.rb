class CreateTypes < ActiveRecord::Migration
  def change
    create_table :Types do |t|
      t.string :text

      t.timestamps
    end
  end
end
