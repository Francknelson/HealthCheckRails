class HomeClinicSearchController < ApplicationController
  def index
    @clinics = Clinic.search(params[:search])
  end

  def show
    @clinic = Clinic.find(params[:id])
  end
end
