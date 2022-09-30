class DoctorsAppointmentsController < ApplicationController
  before_action :set_doctors_appointment, only: %i[ show edit update destroy ]

  # GET /doctors_appointments or /doctors_appointments.json
  def index
    @doctors_appointments = DoctorsAppointment.all
  end

  # GET /doctors_appointments/1 or /doctors_appointments/1.json
  def show
  end

  # GET /doctors_appointments/new
  def new
    @doctors_appointment = DoctorsAppointment.new
  end

  # GET /doctors_appointments/1/edit
  def edit
  end

  # POST /doctors_appointments or /doctors_appointments.json
  def create
    @doctors_appointment = DoctorsAppointment.new(doctors_appointment_params)

    respond_to do |format|
      if @doctors_appointment.save
        format.html { redirect_to doctors_appointment_url(@doctors_appointment), notice: "Doctors appointment was successfully created." }
        format.json { render :show, status: :created, location: @doctors_appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doctors_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors_appointments/1 or /doctors_appointments/1.json
  def update
    respond_to do |format|
      if @doctors_appointment.update(doctors_appointment_params)
        format.html { redirect_to doctors_appointment_url(@doctors_appointment), notice: "Doctors appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @doctors_appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doctors_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors_appointments/1 or /doctors_appointments/1.json
  def destroy
    @doctors_appointment.destroy

    respond_to do |format|
      format.html { redirect_to doctors_appointments_url, notice: "Doctors appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctors_appointment
      @doctors_appointment = DoctorsAppointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctors_appointment_params
      params.fetch(:doctors_appointment, {})
    end
end
