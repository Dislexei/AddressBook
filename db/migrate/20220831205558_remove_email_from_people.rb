class RemoveEmailFromPeople < ActiveRecord::Migration[6.0]
  def change
    remove_reference :people, :email, null: false, foreign_key: true
  end
end
