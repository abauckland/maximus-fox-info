class CreatePostscripts < ActiveRecord::Migration
  def change
    create_table :postscripts do |t|
      t.string :text

      t.timestamps
    end
  end
end
