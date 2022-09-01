class ChangeTableEmailsFixColumnNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :emails, :emailaddress, :email_address
  end
end
