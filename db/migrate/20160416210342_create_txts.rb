class CreateTxts < ActiveRecord::Migration
  def change
    create_table :txts do |t|
      t.string :text

      t.timestamps
    end
  end
end
