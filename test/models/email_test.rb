require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  setup do
    @person = people(:personson)
  end
  

  # basic test, checking if user can be saved under ideal conditions
  test "email with correct attributes can be saved" do
    email = Email.new(person_id: @person.id, email_address: "email@email.com" )
    assert email.valid?
    email.save!
    assert_equal "email@email.com", Email.last.email_address
    assert_equal @person.id, Email.last.person_id
  end

  
  test "email with incorrect email cannot be saved" do
    email = Email.new(person_id: @person.id, email_address: "emailemail.com" )
    assert email.invalid?
    assert_raises ActiveRecord::RecordInvalid do
      email.save!
    end

    assert email.errors[:email_address].any?
  end
  
  
end
