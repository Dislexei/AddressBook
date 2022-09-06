class AddPhoneNumberRefToPeople < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :phone_number, null: true, foreign_key: true
  end
end
