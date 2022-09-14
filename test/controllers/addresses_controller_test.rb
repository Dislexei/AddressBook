require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:john)
  end


  test "new, should get redirected to login, not signed in" do
    @person = people(:personson)
    assert_no_difference('Address.count') do
      get new_person_address_url(@person.id)
    end
    assert_redirected_to login_url
  end


  test "new, should pass, signed in" do
    sign_in_as
    @person = people(:personson)
    assert_no_difference('Address.count') do
      get new_person_address_url(@person.id)
    end
    assert_response 200
  end


  test "edit, should get redirected to login, not signed in" do
    @person = people(:personson)
    @address = addresses(:adresson)
    get edit_person_address_url(@person.id, @address)
    assert_redirected_to login_url
  end

  test "edit not owner, should redirect to people index, signed in" do
     sign_in_as
     @person = people(:personova)
     @address = addresses(:adresson)
     get edit_person_address_url(@person.id, @address)
     assert_redirected_to people_path
   end

  test "edit as owner, should return status OK, signed in" do
    sign_in_as
    @person = people(:personson)
    @address = addresses(:adresson)
    get edit_person_address_url(@person.id, @address)
    assert_response 200
  end


  test "index, should get redirected to login, not signed in" do
    @person = people(:personson)
    get person_addresses_url(@person.id)
    assert_redirected_to login_url
  end


  test "index not owner,should redirect to people index, signed in" do
    sign_in_as
    @person = people(:personova)
    get person_addresses_url(@person)
    assert_redirected_to people_path
  end

  test "index as owner, should return status OK, signed in" do
     sign_in_as
     @person = people(:personson)
     get person_addresses_url(@person)
     assert_response 200
   end


  test "show, should get redirected to login, not signed in" do
     @person = people(:personson)
     @address = addresses(:adresson)
     get person_address_url(@person.id, @address)
     assert_redirected_to login_url
  end


  test "show as not owner, should get redirected people index, signed in" do
     sign_in_as
     @person = people(:personova)
     @address = addresses(:two)
     get person_address_url(@person.id, @address)
     assert_redirected_to people_path
   end

   test "show as owner, should return OK, signed in" do
     sign_in_as
     @person = people(:personson)
     @address = addresses(:adresson)
     get person_address_url(@person.id, @address.id)
     assert_response 200
   end

  test "create, should get redirected to login, not signed in" do
     @person = people(:personson)
     assert_no_difference('Address.count') do
     post person_addresses_url(@person.id), params: { address: {street: "str", town: "twn", zip_code: "123123", country: "CZ"} }
    end
    assert_redirected_to login_url
  end

  test "create as not owner, should get redirected to people index, signed in" do
     sign_in_as
     @person = people(:personova)
     assert_no_difference('Address.count') do
          post person_addresses_url(@person.id), params: { address: {street: "str", town: "twn", zip_code: "123123", country: "CZ"} }
     end
     assert_redirected_to people_path
     end


     test "create as owner, should create new address redirect to person_path, signed in" do
          sign_in_as
          @person = people(:personson)
          assert_difference('Address.count') do
               post person_addresses_url(@person.id), params: { address: {street: "str", town: "twn", zip_code: "123123", country: "CZ"} }
          end
          assert Address.last.valid?
          assert_equal "str", Address.last.street
          assert_equal "twn", Address.last.town
          assert_equal "123123", Address.last.zip_code
          assert_equal "CZ", Address.last.country

          assert_equal @person.id, Address.last.person_id
          assert_redirected_to person_url(@person.id)
     end


  test "update, should get redirected to login, not signed in" do
     @person = people(:personson)
     @address = addresses(:adresson)
     assert_no_difference('Address.count') do
          patch person_address_url(@person.id, @address.id), params: { address: {street: "str", town: "twn", zip_code: "123123", country: "UK"}}
     end
     assert_not_equal "str", Address.last.street
     assert_not_equal "twn", Address.last.town
     assert_not_equal "123123", Address.last.zip_code
     assert_not_equal "UK", Address.last.country
     assert_redirected_to login_url
  end

  test "update not owner, should get redirected to person_url, signed in" do
     sign_in_as
     @person = people(:personova)
     @address = addresses(:two)
     assert_no_difference('Address.count') do
          patch person_address_url(@person.id, @address.id), params: { address: {street: "str", town: "twn", zip_code: "123123", country: "UK"}}
     end
     @address.reload
     assert_not_equal "str", Address.last.street
     assert_not_equal "twn", Address.last.town
     assert_not_equal "123123", Address.last.zip_code
     assert_not_equal "UK", Address.last.country
     assert_redirected_to people_path
   end

  test "update as owner, should get redirected to person_url, signed in" do
     sign_in_as
     @person = people(:personson)
     @address = addresses(:adresson)
     assert_no_difference('Address.count') do
          patch person_address_url(@person.id, @address.id), params: { address: {street: "str", town: "twn", zip_code: "123123", country: "CZ"} }
     end
     @address.reload
     assert_equal "str", Address.last.street
     assert_equal "twn", Address.last.town
     assert_equal "123123", Address.last.zip_code
     assert_equal "CZ", Address.last.country
     assert_redirected_to person_url(@person.id)
   end

  test "delete, should get redirected to login, not signed in" do
     @person = people(:personson)
     @address = addresses(:adresson)
    assert_no_difference('Address.count') do
      delete person_address_url(@person.id, @address.id)
    end
    assert_redirected_to login_url
  end


  test "delete not owner, should get redirected to people index, signed in" do
     sign_in_as
     @person = people(:personova)
     @address = addresses(:two)
    assert_no_difference('Address.count') do
      delete person_address_url(@person.id, @address.id)
    end
    assert_redirected_to people_path
  end


  test "delete as owner, should delete address and get redirected to person path, signed in" do
     sign_in_as
     @person = people(:personson)
     @address = addresses(:adresson)
    assert_difference('Address.count', -1) do
      delete person_address_url(@person.id, @address.id)
    end
    assert_redirected_to person_url(@person.id)
  end


end
