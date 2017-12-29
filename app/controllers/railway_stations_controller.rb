class RailwayStationsController < ApplicationController
  before_action :set_railway_station, except: %i[index new create]

  def index
    @railway_stations = RailwayStation.order(id: :asc).page params[:page]
    respond_with @railway_stations
  end

  def show; end

  def new
    respond_with @railway_station = RailwayStation.new
  end

  def edit; end

  def create
    respond_with @railway_station = RailwayStation.create(railway_station_params)
  end

  def update
    @railway_station.update(railway_station_params)
    respond_with @railway_station
  end

  def destroy
    respond_with @railway_station.destroy
  end

  private

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
