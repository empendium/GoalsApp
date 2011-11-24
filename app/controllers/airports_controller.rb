class AirportsController < ApplicationController
  
  def show
    @airport = Airport.find(params[:id])
  end
  
  def index
    if params[:zebra].present?
      @airports = Airport.where(["city LIKE ?", "%#{params[:zebra]}%"])
    else
      @airports = Airport.all
    end
  end
  
end