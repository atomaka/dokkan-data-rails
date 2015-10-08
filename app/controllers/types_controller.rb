class TypesController < ApplicationController
  before_action :set_type, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @types = Type.all
    authorize Type
  end

  def show
    authorize @type
  end

  def new
    @type = Type.new

    authorize @type
  end

  def create
    @type = Type.new(type_params)

    authorize @type

    if @type.save
      redirect_to types_path, notice: 'Type was created'
    else
      render :new
    end
  end

  def edit
    authorize @type
  end

  def update
    authorize @type

    if @type.update(type_params)
      redirect_to types_path, notice: 'Type was updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @type

    @type.destroy

    redirect_to types_path, notice: 'Type was deleted'
  end

  private

  def type_params
    params.require(:type).permit(:name, :description)
  end

  def set_type
    @type = Type.find(params[:id])
  end
end
