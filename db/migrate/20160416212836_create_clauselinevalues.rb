class CreateClauselinevalues < ActiveRecord::Migration
  def change
    create_table :clauselinevalues do |t|
      t.integer :clauseline_id
      t.integer :linevalue_id

      t.timestamps
    end

    add_index :clauselinevalues, :clauseline_id, name: "CLAUSELINE", unique: true, using: :btree

  end
end
