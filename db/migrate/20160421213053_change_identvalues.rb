class ChangeIdentvalues < ActiveRecord::Migration
  def change
    remove_column :identvalues, :company_id, :integer
    remove_column :identvalues, :identtxt_id, :integer
    add_column :identvalues, :text, :string

  end
end