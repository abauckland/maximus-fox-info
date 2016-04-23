class ChangeClauselinevalues < ActiveRecord::Migration
  def change    
    remove_index :clauselinevalues, name: "CLAUSELINE"
    add_index :clauselinevalues, :clauseline_id, name: "CLAUSELINE", using: :btree
  end
end
