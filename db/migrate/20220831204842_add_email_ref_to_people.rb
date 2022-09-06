class AddEmailRefToPeople < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :email, null: true, foreign_key: true
  end
end
