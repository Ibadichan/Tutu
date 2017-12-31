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

  def edit; end

  def create
    respond_with @train = Train.create(train_params)
  end

  def update
    @train.update(train_params)
    respond_with @train
  end

  def destroy
    respond_with @train.destroy
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number)
  end
end
