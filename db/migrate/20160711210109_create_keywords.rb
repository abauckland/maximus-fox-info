class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :productkeywords do |t|
      t.string :text

      t.timestamps
    end
  end
end
