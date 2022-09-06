class ChangeTablePhoneNumbersFixColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :phone_numbers, :phonenumber, :phone_number
  end
end
