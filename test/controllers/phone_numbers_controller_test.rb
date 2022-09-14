require 'test_helper'

class PhoneNumbersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:john)
  end


  test "new, should get redirected to login, not signed in" do
    @person = people(:personson)
    assert_no_difference('PhoneNumber.count') do
      get new_person_phone_number_url(@person.id)
    end
    assert_redirected_to login_url
  end


  test "new, should pass, signed in" do
    sign_in_as
    @person = people(:personson)
    assert_no_difference('PhoneNumber.count') do
      get new_person_phone_number_url(@person.id)
    end
    assert_response 200
  end


  test "edit, should get redirected to login, not signed in" do
    @person = people(:personson)
    @phone_number = phone_numbers(:one)
    get edit_person_phone_number_url(@person.id, @phone_number)
    assert_redirected_to login_url
  end

  test "edit not owner, should redirect to people index, signed in" do
     sign_in_as
     @person = people(:personova)
     @phone_number = phone_numbers(:one)
     get edit_person_phone_number_url(@person.id, @phone_number)
     assert_redirected_to people_path
   end

  test "edit as owner, should return status OK, signed in" do
    sign_in_as
    @person = people(:personson)
    @phone_number = phone_numbers(:one)
    get edit_person_phone_number_url(@person.id, @phone_number)
    assert_response 200
  end


  test "index, should get redirected to login, not signed in" do
    @person = people(:personson)
    get person_phone_numbers_url(@person.id)
    assert_redirected_to login_url
  end


  test "index not owner,should redirect to people index, signed in" do
    sign_in_as
    @person = people(:personova)
    get person_phone_numbers_url(@person)
    assert_redirected_to people_path
  end

  test "index as owner, should return status OK, signed in" do
     sign_in_as
     @person = people(:personson)
     get person_phone_numbers_url(@person)
     assert_response 200
   end


  test "show, should get redirected to login, not signed in" do
     @person = people(:personson)
     @phone_number = phone_numbers(:one)
     get person_phone_number_url(@person.id, @phone_number)
     assert_redirected_to login_url
  end


  test "show as not owner, should get redirected people index, signed in" do
     sign_in_as
     @person = people(:personova)
     @phone_number = phone_numbers(:two)
     get person_phone_number_url(@person.id, @phone_number)
     assert_redirected_to people_path
   end

   test "show as owner, should return OK, signed in" do
     sign_in_as
     @person = people(:personson)
     @phone_number = phone_numbers(:one)
     get person_phone_number_url(@person.id, @phone_number.id)
     assert_response 200
   end

  test "create, should get redirected to login, not signed in" do
     @person = people(:personson)
     assert_no_difference('PhoneNumber.count') do
     post person_phone_numbers_url(@person.id), params: { phone: {phone_number: "420111222333", comment: "testComment"} }
    end
    assert_redirected_to login_url
  end

  test "create as not owner, should get redirected to people index, signed in" do
     sign_in_as
     @person = people(:personova)
     assert_no_difference('PhoneNumber.count') do
          post person_phone_numbers_url(@person.id), params: { phone: {phone_number: "420111222333", comment: "testComment"} }
     end
     assert_redirected_to people_path
     end


     test "create as owner, should create new phone number redirect to person_path, signed in" do
          sign_in_as
          @person = people(:personson)
          assert_difference('PhoneNumber.count') do
               post person_phone_numbers_url(@person.id), params: { phone_number: {phone_number: "420111222333", comment: "testComment"} }
          end
          assert_equal "420111222333", PhoneNumber.last.phone_number
          assert_equal "testComment", PhoneNumber.last.comment
          assert_equal @person.id, PhoneNumber.last.person_id
          assert_redirected_to person_url(@person.id)
     end


  test "update, should get redirected to login, not signed in" do
     @person = people(:personson)
     @phone_number = phone_numbers(:one)
     assert_no_difference('PhoneNumber.count') do
          patch person_phone_number_url(@person.id, @phone_number.id), params: { phone_number: { phone_number: "420111222333", comment: "comment" }}
     end
     assert_not_equal "420111222333", @phone_number.phone_number
     assert_not_equal "comment", @phone_number.comment
     assert_redirected_to login_url
  end

  test "update not owner, should get redirected to person_url, signed in" do
     sign_in_as
     @person = people(:personova)
     @phone_number = phone_numbers(:two)
     assert_no_difference('PhoneNumber.count') do
          patch person_phone_number_url(@person.id, @phone_number.id), params: { phone_number: { phone_number: "420111222333", comment: "comment" }}
     end
     @phone_number.reload
     assert_not_equal "420111222333", @phone_number.phone_number
     assert_not_equal "comment", @phone_number.comment
     assert_redirected_to people_path
   end

  test "update as owner, should get redirected to person_url, signed in" do
     sign_in_as
     @person = people(:personson)
     @phone_number = phone_numbers(:one)
     assert_no_difference('PhoneNumber.count') do
          patch person_phone_number_url(@person.id, @phone_number.id), params: { phone_number: { phone_number: "420111222333", comment: "comment" }}
     end
     @phone_number.reload
     assert_equal "420111222333", @phone_number.phone_number
     assert_equal "comment", @phone_number.comment
     assert_redirected_to person_url(@person.id)
   end

  test "delete, should get redirected to login, not signed in" do
     @person = people(:personson)
     @phone_number = phone_numbers(:one)
    assert_no_difference('PhoneNumber.count') do
      delete person_phone_number_url(@person.id, @phone_number.id)
    end
    assert_redirected_to login_url
  end


  test "delete not owner, should get redirected to people index, signed in" do
     sign_in_as
     @person = people(:personova)
     @phone_number = phone_numbers(:two)
    assert_no_difference('PhoneNumber.count') do
      delete person_phone_number_url(@person.id, @phone_number.id)
    end
    assert_redirected_to people_path
  end


  test "delete as owner, should delete phone number and get redirected to person path, signed in" do
     sign_in_as
     @person = people(:personson)
     @phone_number = phone_numbers(:one)
    assert_difference('PhoneNumber.count', -1) do
      delete person_phone_number_url(@person.id, @phone_number.id)
    end
    assert_redirected_to person_url(@person.id)
  end


end
