class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.integer :salutation
      t.string :firstName
      t.string :middleName
      t.string :lastName
      t.string :ssn
      t.date :birthDate
      t.text :comment

      t.timestamps
    end
  end
end
