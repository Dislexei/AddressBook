class RemovePhoneFromPeople < ActiveRecord::Migration[6.0]
  def change
    remove_reference :people, :phone_number, null: false, foreign_key: true
  end
end
