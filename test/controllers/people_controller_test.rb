require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:john)
  end


  test "new, should get redirected to login, not signed in" do
    assert_no_difference('Person.count') do
      get new_person_url
    end
    assert_redirected_to login_url
  end


  test "new, should pass, signed in" do
    sign_in_as
    assert_no_difference('Person.count') do
      get new_person_url
    end
    assert_response 200
  end


  test "edit, should get redirected to login, not signed in" do
    get edit_person_url(people(:personson).id)
    assert_redirected_to login_url
  end


  test "edit, should return status OK, signed in" do
    sign_in_as
    get edit_person_url(people(:personson).id)
    assert_response 200
  end


  test "index, should get redirected to login, not signed in" do
    get people_url
    assert_redirected_to login_url
  end


  test "index, should get people, signed in" do
    sign_in_as
    get people_url
    assert_response 200
  end


  test "show, should get redirected to login, not signed in" do
    get person_url(people(:personson).id)
    assert_redirected_to login_url
  end

  test "show, should return status OK, signed in" do
    sign_in_as
    get person_url(people(:personson).id)
    assert_response 200
  end


  test "create, should get redirected to login, not signed in" do
    assert_no_difference('Person.count') do
      get people_url(first_name: "Alan", last_name: "Turing")
    end
    assert_redirected_to login_url
  end


  test "create, should create new person, signed in" do
    @user = users(:john)
    sign_in_as (@user)
    assert_difference('Person.count') do
      post people_url, params: { person: { first_name: "Alan", last_name: "Turing", user_id: @user.id } }
    end
    assert_redirected_to person_url(Person.last.id)
  end


  test "update, should get redirected to login, not signed in" do
    patch person_url(people(:personson).id), params: { first_name: "Abraham", last_name: "linconl" }
    assert_redirected_to login_url
  end


  test "update, should update person, signed in" do
    person = people(:personson)
    sign_in_as
    patch person_url(person.id), params: { person: { first_name: "Abraham", last_name: "linconl" } }
    person.reload
    assert_equal "Abraham", person.first_name
    assert_equal "linconl", person.last_name
    assert_redirected_to person_url(person.id)
  end


  test "delete, should get redirected to login, not signed in" do
    assert_no_difference('Person.count') do
      delete person_url(people(:personson).id)
    end
    assert_redirected_to login_url
  end


  test "delete, should delete person, signed in" do
    sign_in_as
    person = people(:personson)
    assert_difference('Person.count', -1) do
      delete person_url(person.id)
    end
    assert_equal 0, Address.where(person_id: person.id).count
    assert_equal 0, PhoneNumber.where(person_id: person.id).count
    assert_equal 0, Email.where(person_id: person.id).count
    assert_redirected_to root_path
  end


end
