require "application_system_test_case"

class DoctorsAppointmentsTest < ApplicationSystemTestCase
  setup do
    @doctors_appointment = doctors_appointments(:one)
  end

  test "visiting the index" do
    visit doctors_appointments_url
    assert_selector "h1", text: "Doctors appointments"
  end

  test "should create doctors appointment" do
    visit doctors_appointments_url
    click_on "New doctors appointment"

    click_on "Create Doctors appointment"

    assert_text "Doctors appointment was successfully created"
    click_on "Back"
  end

  test "should update Doctors appointment" do
    visit doctors_appointment_url(@doctors_appointment)
    click_on "Edit this doctors appointment", match: :first

    click_on "Update Doctors appointment"

    assert_text "Doctors appointment was successfully updated"
    click_on "Back"
  end

  test "should destroy Doctors appointment" do
    visit doctors_appointment_url(@doctors_appointment)
    click_on "Destroy this doctors appointment", match: :first

    assert_text "Doctors appointment was successfully destroyed"
  end
end
