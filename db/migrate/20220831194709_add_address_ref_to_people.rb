class AddAddressRefToPeople < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :address, null: true, foreign_key: true
  end
end
