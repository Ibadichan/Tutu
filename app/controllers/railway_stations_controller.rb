class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: :show

  def index
    @railway_stations = RailwayStation.order(id: :asc).page params[:page]
    respond_with @railway_stations
  end

  def show; end

  def new
    respond_with @railway_station = RailwayStation.new
  end

  def create
    respond_with @railway_station = RailwayStation.create(railway_station_params)
  end

  private

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
