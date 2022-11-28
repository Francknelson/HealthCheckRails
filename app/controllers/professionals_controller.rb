class ProfessionalsController < ApplicationController
  before_action :set_professional, only: %i[ show edit update destroy ]
  before_action :set_users, only: %i[ new create edit update ]
  before_action :set_specialties, only: %i[ new create edit update ]
  before_action :set_clinic, only: %i[ new create update edit ]

  # GET /professionals or /professionals.json
  def index
    @professionals = Professional.where(clinic_id: @current_user.clinic.id).search(params[:search]) if @current_user.user_type == "clinic"
    @professionals = Professional.search(params[:search]) if @current_user.user_type == "admin"

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

  # GET /professionals/1 or /professionals/1.json
  def show
  end

  # GET /professionals/new
  def new
    @professional = Professional.new
  end

  # GET /professionals/1/edit
  def edit
  end

  # POST /professionals or /professionals.json
  def create
    @professional = Professional.new(professional_params)

    respond_to do |format|
      if @professional.save
        if @professional.user.user_type.nil?
          @professional.user.update(user_type: "professional")
        end
        @professional.user.user_type = "professional" if @professional.user.user_type.nil?
        format.html { redirect_to professionals_url, notice: "Profissional criado com sucesso!" }
        format.json { render :index, status: :created, location: @professional }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professionals/1 or /professionals/1.json
  def update
    respond_to do |format|
      if @professional.update(professional_params)
        format.html { redirect_to professional_url(@professional), notice: "Profissional atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @professional }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professionals/1 or /professionals/1.json
  def destroy
    @professional.user.update(user_type: nil)
    @professional.destroy

    respond_to do |format|
      format.html { redirect_to professionals_url, notice: "Profissional excluído com sucesso!" }
      format.json { head :no_content }
    end
  end

  private

  def set_clinic
    @clinics = Clinic.all
  end

  def set_users
    @users = User.where(user_type: nil)
  end

  def set_specialties
    @specialties = Specialty.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_professional
    @professional = Professional.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def professional_params
    params.require(:professional).permit(:user_id, :cnpj, :professional_record, :clinic_id, :search, specialty_ids: [])
  end
end
