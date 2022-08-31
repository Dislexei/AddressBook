class RemovePhoneFromPeople < ActiveRecord::Migration[7.0]
  def change
    remove_reference :people, :phone_number, null: false, foreign_key: true
  end
end
