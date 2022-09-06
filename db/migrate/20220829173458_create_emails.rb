class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string :emailaddress
      t.text :comment

      t.timestamps
    end
  end
end
