class ChangeClauselines < ActiveRecord::Migration
  def change    
    remove_index :clauselines, name: "SUBCLAUSE"
    add_index :clauselines, :subclause_id, name: "SUBCLAUSE", using: :btree
  end
end
