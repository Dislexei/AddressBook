class AddPersonBelongsToToEmails < ActiveRecord::Migration[6.0]
  def change
    add_reference :emails, :person, null: false, foreign_key: true
  end
end
