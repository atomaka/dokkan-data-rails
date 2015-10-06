class AwakenTypesController < ApplicationController
  before_action :set_awaken_type, only: [:show, :edit, :update, :destroy]

  def index
    @awaken_types = AwakenType.all
  end

  def show
  end

  def new
    @awaken_type = AwakenType.new
  end

  def create
    @awaken_type = AwakenType.new(awaken_type_params)

    if @awaken_type.save
      redirect_to awaken_types_path, notice: 'Awaken Type was created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @awaken_type.update(awaken_type_params)
      redirect_to awaken_types_path, notice: 'Awaken Type was updated'
    else
      render :edit
    end
  end

  def destroy
    @awaken_type.destroy

    redirect_to awaken_types_path, notice: 'Awaken Type was deleted'
  end

  private

  def awaken_type_params
    params.require(:awaken_type).permit(:name)
  end

  def set_awaken_type
    @awaken_type = AwakenType.find(params[:id])
  end
end
