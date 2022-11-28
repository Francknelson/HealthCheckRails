class SpecialtiesController < ApplicationController
  before_action :set_specialty, only: %i[ show edit update destroy ]

  # GET /specialties or /specialties.json
  def index
    @specialties = Specialty.search(params[:search])

    respond_to do |format|
      format.html

      format.pdf { render pdf: "articles-list-report",
                          footer: { center: "[page] of [topage]" }
      }
    end
  end

  # GET /specialties/1 or /specialties/1.json
  def show
  end

  # GET /specialties/new
  def new
    @specialty = Specialty.new
  end

  # GET /specialties/1/edit
  def edit
  end

  # POST /specialties or /specialties.json
  def create
    @specialty = Specialty.new(specialty_params)

    respond_to do |format|
      if @specialty.save
        format.html { redirect_to specialty_url(@specialty), notice: "Especialidade criada com sucesso!" }
        format.json { render :show, status: :created, location: @specialty }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialties/1 or /specialties/1.json
  def update
    respond_to do |format|
      if @specialty.update(specialty_params)
        format.html { redirect_to specialty_url(@specialty), notice: "Especialidade atualizada com sucesso!" }
        format.json { render :show, status: :ok, location: @specialty }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialties/1 or /specialties/1.json
  def destroy
    @specialty.destroy

    respond_to do |format|
      format.html { redirect_to specialties_url, notice: "Especialidade excluída com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialty
      @specialty = Specialty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def specialty_params
      params.require(:specialty).permit(:description)
    end
end
