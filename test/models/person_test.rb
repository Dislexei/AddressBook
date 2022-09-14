require "test_helper"

class PersonTest < ActiveSupport::TestCase

    setup do
      @user = users(:john)
    end


    test "let's see if tests actually work" do
      assert true
    end
    

    test "person with correct attributes can be saved" do
      person = Person.new(first_name: "John", last_name: "Doe", user_id: @user.id)
      assert person.valid?
      person.save!
      assert_equal "John", Person.last.first_name
      assert_equal "Doe", Person.last.last_name
    end
    

    test "person attributes first_name and last_name must not be empty" do
      person = Person.new(user_id: @user.id)
      assert person.invalid?
      assert person.errors[:first_name].any?
      assert person.errors[:last_name].any?
    end


    test "person attributes first_name must be more than 2 lenght" do
      person = Person.new(first_name: "J", last_name: "Doe", user_id: @user.id)
      assert person.invalid?
      assert person.errors[:first_name].any?
      assert !person.errors[:last_name].any?
    end


    test "person attribute ssn can only have 3-2-4 numeric values (US standard), should fail" do
      person = Person.new(first_name: "Joe", last_name: "Doe", ssn: "xxx", user_id: @user.id)
      assert person.invalid?
      assert person.errors[:ssn].any?
    end


    test "person attribute ssn can only have 3-2-4 numeric values (US standard), should pass" do
      person = Person.new(first_name: "Joe", last_name: "Doe", ssn: "111-22-4444", user_id: @user.id)
      assert person.valid?
      assert !person.errors[:ssn].any?
    end

    
end
