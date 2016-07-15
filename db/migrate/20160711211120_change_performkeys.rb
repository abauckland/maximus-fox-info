class ChangePerformkeys < ActiveRecord::Migration
  def change

    add_column :performkeys, :unit_id, :integer
    add_column :performkeys, :standard_id, :integer

  end
end
