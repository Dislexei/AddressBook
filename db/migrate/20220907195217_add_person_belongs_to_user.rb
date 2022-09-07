class AddPersonBelongsToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :user, null: false, foreign_key: true
  end
end
