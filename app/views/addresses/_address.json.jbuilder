json.extract! address, :id, :street, :town, :zip_code, :state, :country, :created_at, :updated_at
json.url address_url(address, format: :json)
