class TrainsController < ApplicationController
  before_action :set_train, except: %i[new create index]

  def index
    @trains = Train.order(id: :asc).page params[:page]
    respond_with @trains
  end

  def show; end

  def new
    respond_with @train = Train.new
  end

  def create
    respond_with @train = Train.create(train_params)
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number)
  end
end
