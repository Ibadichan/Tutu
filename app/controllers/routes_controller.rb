class RoutesController < ApplicationController
  def index
    respond_with @routes = Route.all
  end

  def new
    respond_with @route = Route.new
  end

  def create
    respond_with @route = Route.create(route_params)
  end

  def show
    respond_with @route = Route.find(params[:id])
  end

  private

  def route_params
    params.require(:route).permit(:title)
  end
end
