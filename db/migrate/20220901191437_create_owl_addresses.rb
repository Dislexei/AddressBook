class CreateOwlAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :owl_addresses do |t|
      t.string :owladdress
      t.text :comment
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
