class AddPersonBelongsToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :addresses, :person, null: false, foreign_key: true
  end
end
