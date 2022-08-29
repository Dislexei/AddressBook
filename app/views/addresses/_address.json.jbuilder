json.extract! address, :id, :street, :town, :zipcode, :state, :country, :created_at, :updated_at
json.url address_url(address, format: :json)
