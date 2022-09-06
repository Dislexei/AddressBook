require "test_helper"

class PersonTest < ActiveSupport::TestCase

    # basic test, checking if user can be saved under ideal conditions
    test "person with correct attributes can be saved" do

      # I create the person via new (I know I need to pass valid attributes based on person model validations)
      # You can add more things into attributes
      person = Person.new(first_name: "John", last_name: "Doe")

      # I check validity of record
      assert person.valid?

      # I save record into test db (don't worry this gets cleared each time)
      person.save!

      # I check the the last (latest) record in Person table has the correct first and last name
      assert_equal "John", Person.last.first_name
      assert_equal "Doe", Person.last.last_name
    end
    
    test "person attributes first_name and last_name must not be empty" do
      # create a empty person, we know this should not pass
      person = Person.new
      # check that the record is infact invalid
      assert person.invalid?
      # check for errors (these are use on frontend as well)
      assert person.errors[:first_name].any?
      assert person.errors[:last_name].any?
    end

    test "person attributes first_name must be more than 2 lenght" do
      # create a person with only 1 character for first name
      person = Person.new(first_name: "J", last_name: "Doe")
      # check that the record is infact invalid
      assert person.invalid?
      # check for errors (these are use on frontend as well)
      assert person.errors[:first_name].any?
      # negate, no errors for last name, we know its good
      assert !person.errors[:last_name].any?
    end

end
