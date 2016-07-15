class DropIdentities < ActiveRecord::Migration
  def change
    drop_table :identities
    drop_table :identkeys
    drop_table :identvalues
    drop_table :identtxts
    drop_table :productidentities
  end
end
