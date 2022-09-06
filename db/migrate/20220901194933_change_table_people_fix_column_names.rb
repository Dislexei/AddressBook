class ChangeTablePeopleFixColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :people, :firstName, :first_name
    rename_column :people, :middleName, :middle_name
    rename_column :people, :lastName, :last_name
    rename_column :people, :birthDate, :birth_date
  end
end
