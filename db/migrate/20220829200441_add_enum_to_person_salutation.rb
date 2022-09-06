class AddEnumToPersonSalutation < ActiveRecord::Migration[6.0]
  def change
    remove_column :people, :salutation
    add_column :people, :salutation, :integer, default: 0
  end
end
