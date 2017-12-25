class RoutesController < ApplicationController
  before_action :set_route, except: %i[index new create]

  def index
    @routes = Route.order(id: :asc).page params[:page]
    respond_with @routes
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

  def destroy
    respond_with @route.destroy
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title)
  end
end
