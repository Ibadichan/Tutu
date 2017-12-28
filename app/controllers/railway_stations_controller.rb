class RailwayStationsController < ApplicationController
  def index
    @railway_stations = RailwayStation.order(id: :asc).page params[:page]
    respond_with @railway_stations
  end
end
