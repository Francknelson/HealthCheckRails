class HomeClinicSearchController < ApplicationController
  def index
    @clinics = Clinic.search(params[:search])
  end
end
