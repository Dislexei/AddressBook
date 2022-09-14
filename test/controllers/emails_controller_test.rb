require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:john)
  end


  test "new, should get redirected to login, not signed in" do
    @person = people(:personson)
    assert_no_difference('Email.count') do
      get new_person_email_url(@person.id)
    end
    assert_redirected_to login_url
  end


  test "new, should pass, signed in" do
    sign_in_as
    @person = people(:personson)
    assert_no_difference('Email.count') do
      get new_person_email_url(@person.id)
    end
    assert_response 200
  end


  test "edit, should get redirected to login, not signed in" do
    @person = people(:personson)
    @email = emails(:one)
    get edit_person_email_url(@person.id, @email)
    assert_redirected_to login_url
  end

  test "edit not owner, should redirect to people index, signed in" do
     sign_in_as
     @person = people(:personova)
     @email = emails(:one)
     get edit_person_email_url(@person.id, @email)
     assert_redirected_to people_path
   end

  test "edit as owner, should return status OK, signed in" do
    sign_in_as
    @person = people(:personson)
    @email = emails(:one)
    get edit_person_email_url(@person.id, @email)
    assert_response 200
  end


  test "index, should get redirected to login, not signed in" do
    @person = people(:personson)
    get person_emails_url(@person.id)
    assert_redirected_to login_url
  end


  test "index not owner,should redirect to people index, signed in" do
    sign_in_as
    @person = people(:personova)
    get person_emails_url(@person)
    assert_redirected_to people_path
  end

  test "index as owner, should return status OK, signed in" do
     sign_in_as
     @person = people(:personson)
     get person_emails_url(@person)
     assert_response 200
   end


  test "show, should get redirected to login, not signed in" do
     @person = people(:personson)
     @email = emails(:one)
     get person_email_url(@person.id, @email)
     assert_redirected_to login_url
  end


  test "show as not owner, should get redirected people index, signed in" do
     sign_in_as
     @person = people(:personova)
     @email = emails(:two)
     get person_email_url(@person.id, @email)
     assert_redirected_to people_path
   end

   test "show as owner, should return OK, signed in" do
     sign_in_as
     @person = people(:personson)
     @email = emails(:one)
     get person_email_url(@person.id, @email.id)
     assert_response 200
   end

  test "create, should get redirected to login, not signed in" do
     @person = people(:personson)
     assert_no_difference('Email.count') do
     post person_emails_url(@person.id), params: { email: {email_address: "test@email.com", comment: "testComment"} }
    end
    assert_redirected_to login_url
  end

  test "create as not owner, should get redirected to people index, signed in" do
     sign_in_as
     @person = people(:personova)
     assert_no_difference('Email.count') do
          post person_emails_url(@person.id), params: { email: {email_address: "test@email.com", comment: "testComment"} }
     end
     assert_redirected_to people_path
     end


     test "create as owner, should create new email redirect to person_path, signed in" do
          sign_in_as
          @person = people(:personson)
          assert_difference('Email.count') do
               post person_emails_url(@person.id), params: { email: {email_address: "test@email.com", comment: "testComment"} }
          end
          assert_equal "test@email.com", Email.last.email_address
          assert_equal "testComment", Email.last.comment
          assert_equal @person.id, Email.last.person_id
          assert_redirected_to person_url(@person.id)
     end


  test "update, should get redirected to login, not signed in" do
     @person = people(:personson)
     @email = emails(:one)
     assert_no_difference('Email.count') do
          patch person_email_url(@person.id, @email.id), params: { email: { email_address: "lincoln@gmail.com", comment: "comment" }}
     end
     assert_not_equal "lincoln@gmail.com", @email.email_address
     assert_not_equal "comment", @email.comment
     assert_redirected_to login_url
  end

  test "update not owner, should get redirected to person_url, signed in" do
     sign_in_as
     @person = people(:personova)
     @email = emails(:two)
     assert_no_difference('Email.count') do
          patch person_email_url(@person.id, @email.id), params: { email: { email_address: "lincoln@gmail.com", comment: "comment" }}
     end
     @email.reload
     assert_not_equal "lincoln@gmail.com", @email.email_address
     assert_not_equal "comment", @email.comment
     assert_redirected_to people_path
   end

  test "update as owner, should get redirected to person_url, signed in" do
     sign_in_as
     @person = people(:personson)
     @email = emails(:one)
     assert_no_difference('Email.count') do
          patch person_email_url(@person.id, @email.id), params: { email: { email_address: "lincoln@gmail.com", comment: "comment" }}
     end
     @email.reload
     assert_equal "lincoln@gmail.com", @email.email_address
     assert_equal "comment", @email.comment
     assert_redirected_to person_url(@person.id)
   end

  test "delete, should get redirected to login, not signed in" do
     @person = people(:personson)
     @email = emails(:one)
    assert_no_difference('Email.count') do
      delete person_email_url(@person.id, @email.id)
    end
    assert_redirected_to login_url
  end


  test "delete not owner, should get redirected to people index, signed in" do
     sign_in_as
     @person = people(:personova)
     @email = emails(:two)
    assert_no_difference('Email.count') do
      delete person_email_url(@person.id, @email.id)
    end
    assert_redirected_to people_path
  end


  test "delete as owner, should delete email and get redirected to person path, signed in" do
     sign_in_as
     @person = people(:personson)
     @email = emails(:one)
    assert_difference('Email.count', -1) do
      delete person_email_url(@person.id, @email.id)
    end
    assert_redirected_to person_url(@person.id)
  end


end
