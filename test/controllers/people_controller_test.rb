require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create person" do
    assert_difference("Person.count") do
      post users_url, params: { person: {  } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show person" do
    get user_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch user_url(@person), params: { person: {  } }
    assert_redirected_to user_url(@person)
  end

  test "should destroy person" do
    assert_difference("Person.count", -1) do
      delete user_url(@person)
    end

    assert_redirected_to users_url
  end
end
