require "test_helper"

class DoctorsAppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctors_appointment = doctors_appointments(:one)
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_url
    assert_response :success
  end

  test "should create doctors_appointment" do
    assert_difference("Appointment.count") do
      post appointments_url, params: { doctors_appointment: {  } }
    end

    assert_redirected_to appointment_url(Appointment.last)
  end

  test "should show doctors_appointment" do
    get appointment_url(@doctors_appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_url(@doctors_appointment)
    assert_response :success
  end

  test "should update doctors_appointment" do
    patch appointment_url(@doctors_appointment), params: { doctors_appointment: {  } }
    assert_redirected_to appointment_url(@doctors_appointment)
  end

  test "should destroy doctors_appointment" do
    assert_difference("Appointment.count", -1) do
      delete appointment_url(@doctors_appointment)
    end

    assert_redirected_to appointments_url
  end
end
