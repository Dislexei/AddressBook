class ChangeTableAddressesFixColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :zipcode, :zip_code
  end
end
