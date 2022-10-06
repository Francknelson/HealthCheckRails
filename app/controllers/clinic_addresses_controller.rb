class ClinicAddressesController < ApplicationController
  before_action :set_clinic
  before_action :set_clinic_address, only: %i[ show edit update destroy ]

  # GET /addresses or /addresses.json
  def index
    @clinic_addresses = @clinic.clinic_addresses
  end

  # GET /addresses/1 or /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @clinic_address = @clinic.clinic_addresses.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses or /addresses.json
  def create
    @clinic_address = @clinic.clinic_addresses.new(address_params)

    respond_to do |format|
      if @clinic_address.save
        format.html { redirect_to clinic_path(@clinic), notice: "Endereço criado com sucesso!" }
        format.json { render :show, status: :created, location: @clinic_address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clinic_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    respond_to do |format|
      if @clinic_address.update(address_params)
        format.html { redirect_to clinic_path(@clinic), notice: "Endereço atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @clinic_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clinic_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @clinic_address.destroy

    respond_to do |format|
      format.html { redirect_to clinic_path(@clinic),
                                notice: "Endereço excluído com sucesso!" }
      format.json { head :no_content }
    end
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_clinic_address
    @clinic_address = @clinic.clinic_addresses.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_params
    params.require(:clinic_address).permit(:clinic_id, :street, :number, :complement, :neighborhood, :city, :state, :zipcode)
  end
end
