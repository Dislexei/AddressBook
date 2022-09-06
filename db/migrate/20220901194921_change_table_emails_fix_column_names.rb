class ChangeTableEmailsFixColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :emails, :emailaddress, :email_address
  end
end
