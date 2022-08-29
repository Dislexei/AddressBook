class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :town
      t.string :zipcode
      t.string :state
      t.integer :country

      t.timestamps
    end
  end
end
