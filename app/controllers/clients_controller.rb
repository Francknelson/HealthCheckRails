class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :set_users, only: %i[ new create edit update ]
  before_action :set_clinic, only: %i[ new show edit update destroy ]

  # GET /clients or /clients.json
  def index
    @clients = Client.search(params[:search]) if @current_user.admin?
    @clients = Client.where(clinic_id: @current_user.professional.clinic.id).search(params[:search]) if @current_user.professional? || @current_user.clinic?
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        if @client.user.user_type.nil?
          @client.user.update(user_type: "client")
        end
        format.html { redirect_to clients_path, notice: "Paciente criado com sucesso!" }
        format.json { render :index, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_path(@client), notice: "Paciente atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.user.update(user_type: nil)
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Paciente excluído com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  def set_users
    @users = User.where(user_type: nil)
  end
  def set_clinic
    @clinics = Clinic.all
  end
  # Only allow a list of trusted parameters through.
  def client_params
    params.require(:client).permit(:cpf, :user_id, :rg, :birth_date, :clinic_id)
  end
end
