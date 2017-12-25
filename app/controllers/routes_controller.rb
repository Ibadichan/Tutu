class RoutesController < ApplicationController
  before_action :set_route, only: %i[edit show update]

  def index
    respond_with @routes = Route.all
  end

  def show; end

  def new
    respond_with @route = Route.new
  end

  def edit; end

  def create
    respond_with @route = Route.create(route_params)
  end

  def update
    @route.update(route_params)
    respond_with @route
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title)
  end
end
