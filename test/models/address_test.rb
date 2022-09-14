require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  setup do
    @person = people(:personson)
  end
  

  # basic test, checking if user can be saved under ideal conditions
  test "address with correct attributes can be saved" do
    address = Address.new(person_id: @person.id, street: "street", town: "town", zip_code: "13000", country: "CZ" )
    assert address.valid?
    address.save!
    assert_equal "street", Address.last.street
    assert_equal "town", Address.last.town
    assert_equal "13000", Address.last.zip_code
    assert_equal "CZ", Address.last.country
    assert_equal @person.id, Address.last.person_id
  end

  
  test "address with incorrect values cannot be saved" do
    address = Address.new(person_id: @person.id, street: "", town: "", zip_code: "", country: "abcd" )
    assert address.invalid?
    assert_raises ActiveRecord::RecordInvalid do
      address.save!
    end

    assert address.errors[:street].any?
    assert address.errors[:town].any?
    assert address.errors[:zip_code].any?
    assert address.errors[:country].any?
  end
end
