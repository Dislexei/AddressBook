class AddPersonBelongsToToPhoneNumbers < ActiveRecord::Migration[6.0]
  def change
    add_reference :phone_numbers, :person, null: false, foreign_key: true
  end
end
