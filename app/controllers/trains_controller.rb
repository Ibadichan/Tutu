class TrainsController < ApplicationController
  def index
    @trains = Train.order(id: :asc).page params[:page]
    respond_with @trains
  end
end
