require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "People"
  end

  test "should create person" do
    visit users_url
    click_on "New person"

    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "should update Person" do
    visit user_url(@person)
    click_on "Edit this person", match: :first

    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "should destroy Person" do
    visit user_url(@person)
    click_on "Destroy this person", match: :first

    assert_text "Person was successfully destroyed"
  end
end
