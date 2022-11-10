class HomeProfessionalSearchController < ApplicationController
  def index
    @professionals = Professional.search(params[:search])
  end
end
