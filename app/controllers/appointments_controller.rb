class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]
  before_action :set_clients, only: %i[ new edit update create ]
  before_action :set_professionals, only: %i[ new edit update create ]
  before_action :set_clinics, only: %i[ new edit update create ]

  # GET /appointments or /appointments.json
  def index
    @appointments = Appointment.search(params[:search]) if @current_user.user_type == "admin"
    @appointments = Appointment.where(clinic_id: @current_user.clinic.id).search(params[:search]) if @current_user.user_type == "clinic"
    @appointments = Appointment.where(client_id: @current_user.client.id).search(params[:search]) if @current_user.user_type == "client"
    @appointments = Appointment.where(professional_id: @current_user.professional.id).search(params[:search]) if @current_user.user_type == "professional"

    respond_to do |format|
      format.html
      if @current_user.admin?
        format.pdf { render pdf: "articles-list-report",
                            footer: { center: "[page] of [topage]" }
        }
      end
      format.pdf { render pdf: "articles-list-report",
                          header: {center: "#{@current_user.clinic.corporate_name}"},
                          footer: { center: "[page] of [topage]" }
      }
    end
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointment_url(@appointment), notice: "Consulta cadastrada com sucesso!" }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_url(@appointment), notice: "Consulta atualizada com sucesso!" }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Consulta excluída com sucesso!" }
      format.json { head :no_content }
    end
  end

  def cancel
    @appointment = Appointment.find(params[:appointment_id])
    @appointment.update(status: "Cancelada")

    respond_to do |format|
      format.html { redirect_to appointment_url(@appointment), notice: "Consulta atualizada com sucesso!" }
      format.json { head :no_content }
    end
  end

  def completed
    @appointment = Appointment.find(params[:appointment_id])
    @appointment.update(status: "Concluída")

    respond_to do |format|
      format.html { redirect_to appointment_url(@appointment), notice: "Consulta atualizada com sucesso!" }
      format.json { head :no_content }
    end
  end

  private

  def set_clinics
    @clinics = Clinic.all
  end

  def set_clients
    @clients = Client.all
  end

  def set_professionals
    @professionals = Professional.all
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:person_id, :clinic_id, :appointment_date, :return, :professional_id, :status, :client_id)
  end
end
