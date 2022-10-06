class PersonAddressesController < ApplicationController
  before_action :set_person
  before_action :set_person_address, only: %i[ show edit update destroy ]

  # GET /addresses or /addresses.json
  def index
    @person_addresses = @person.person_addresses
  end

  # GET /addresses/1 or /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @person_address = @person.person_addresses.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses or /addresses.json
  def create
    @person_address = @person.person_addresses.new(address_params)

    respond_to do |format|
      if @person_address.save
        format.html { redirect_to person_path(@person), notice: "Endereço criado com sucesso!" }
        format.json { render :show, status: :created, location: @person_address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    respond_to do |format|
      if @person_address.update(address_params)
        format.html { redirect_to person_path(@person), notice: "Endereço atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @person_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @person_address.destroy

    respond_to do |format|
      format.html { redirect_to person_path(@person),
                                notice: "Endereço excluído com sucesso!" }
      format.json { head :no_content }
    end
  end

  private

  def set_person
    @person = Person.find(params[:person_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_person_address
    @person_address = @person.person_addresses.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_params
    params.require(:person_address).permit(:person_id, :street, :number, :complement, :neighborhood, :city, :state, :zipcode)
  end
end
