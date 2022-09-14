require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  setup do
    @person = people(:personson)
  end
  

  # basic test, checking if user can be saved under ideal conditions
  test "phone number with correct attributes can be saved" do
    phone_number = PhoneNumber.new(person_id: @person.id, phone_number: "420111222333" )
    assert phone_number.valid?
    phone_number.save!
    assert_equal "420111222333", PhoneNumber.last.phone_number
    assert_equal @person.id, PhoneNumber.last.person_id
  end

  
  test "phone number with incorrect email cannot be saved" do
    phone_number = PhoneNumber.new(person_id: @person.id, phone_number: "abxc" )
    assert phone_number.invalid?
    assert_raises ActiveRecord::RecordInvalid do
      phone_number.save!
    end

    assert phone_number.errors[:phone_number].any?
  end
end
