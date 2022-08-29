json.extract! email, :id, :emailaddress, :comment, :created_at, :updated_at
json.url email_url(email, format: :json)
