class CreatePhoneNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :phone_numbers do |t|
      t.string :phonenumber
      t.text :comment

      t.timestamps
    end
  end
end
