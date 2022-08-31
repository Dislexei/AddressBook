class RemoveAddressFromPeople < ActiveRecord::Migration[7.0]
  def change
    remove_reference :people, :address, null: false, foreign_key: true
  end
end
