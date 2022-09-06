class DropSalutationsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table (:salutations if_exists: true)
  end
end
