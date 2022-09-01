class ChangeTableAddressesFixColumnNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :addresses, :zip_code, :zip_code
  end
end
