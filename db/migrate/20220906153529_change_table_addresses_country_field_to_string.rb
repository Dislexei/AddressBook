class ChangeTableAddressesCountryFieldToString < ActiveRecord::Migration[6.0]
  def up
    change_column(:addresses, :country, :string, limit: 2)
  end

  def down
    change_column(:addresses, :country, :integer)
  end
end
