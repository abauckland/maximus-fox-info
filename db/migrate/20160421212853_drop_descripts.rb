class DropDescripts < ActiveRecord::Migration
  def change
    drop_table :descripts
  end
end
