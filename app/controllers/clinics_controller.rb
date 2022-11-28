class ClinicsController < ApplicationController
  before_action :set_clinic, only: %i[ show edit update destroy ]
  before_action :set_specialties, only: %i[ new create edit update ]
  before_action :set_users, only: %i[ new create edit update ]


  # GET /clinics or /clinics.json
  def index
    @clinics = Clinic.search(params[:search])

    respond_to do |format|
      format.html

      format.pdf { render pdf: "articles-list-report",
                          footer: { center: "[page] of [topage]" }
      }

    end
  end

  # GET /clinics/1 or /clinics/1.json
  def show
  end

  # GET /clinics/new
  def new
    @clinic = Clinic.new
  end

  # GET /clinics/1/edit
  def edit
  end

  # POST /clinics or /clinics.json
  def create
    @clinic = Clinic.new(clinic_params)

    respond_to do |format|
      if @clinic.save
        if @clinic.user.user_type.nil?
          @clinic.user.update(user_type: "clinic")
        end
        format.html { redirect_to clinics_url, notice: "Clínica criada com sucesso!" }
        format.json { render :index, status: :created, location: @clinic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinics/1 or /clinics/1.json
  def update
    respond_to do |format|
      if @clinic.update(clinic_params)
        format.html { redirect_to clinic_url(@clinic), notice: "Clínica atualizada com sucesso!" }
        format.json { render :show, status: :ok, location: @clinic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinics/1 or /clinics/1.json
  def destroy
    @clinic.user.update(user_type: nil)
    @clinic.destroy

    respond_to do |format|
      format.html { redirect_to clinics_url, notice: "Clínica excluída com sucesso!" }
      format.json { head :no_content }
    end
  end

  private

  def set_specialties
    @specialties = Specialty.all
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  def set_users
    @users = User.where(user_type: nil)
  end

  # Only allow a list of trusted parameters through.
  def clinic_params
    params.require(:clinic).permit(:corporate_name, :cnpj, :address, :phone, :email, :specialty, :user_id, :health_insurance, :search, specialty_ids: [])
  end
end
