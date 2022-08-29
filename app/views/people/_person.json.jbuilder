json.extract! person, :id, :salutation, :firstName, :middleName, :lastName, :ssn, :birthDate, :comment, :created_at, :updated_at
json.url person_url(person, format: :json)
