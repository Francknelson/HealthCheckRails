require "test_helper"

class DoctorsAppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctors_appointment = doctors_appointments(:one)
  end

  test "should get index" do
    get doctors_appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_doctors_appointment_url
    assert_response :success
  end

  test "should create doctors_appointment" do
    assert_difference("DoctorsAppointment.count") do
      post doctors_appointments_url, params: { doctors_appointment: {  } }
    end

    assert_redirected_to doctors_appointment_url(DoctorsAppointment.last)
  end

  test "should show doctors_appointment" do
    get doctors_appointment_url(@doctors_appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_doctors_appointment_url(@doctors_appointment)
    assert_response :success
  end

  test "should update doctors_appointment" do
    patch doctors_appointment_url(@doctors_appointment), params: { doctors_appointment: {  } }
    assert_redirected_to doctors_appointment_url(@doctors_appointment)
  end

  test "should destroy doctors_appointment" do
    assert_difference("DoctorsAppointment.count", -1) do
      delete doctors_appointment_url(@doctors_appointment)
    end

    assert_redirected_to doctors_appointments_url
  end
end
