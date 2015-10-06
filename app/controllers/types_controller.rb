class TypesController < ApplicationController
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  def index
    @types = Type.all
  end

  def show
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)

    if @type.save
      redirect_to types_path, notice: 'Type was created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @type.update(type_params)
      redirect_to types_path, notice: 'Type was updated'
    else
      render :edit
    end
  end

  def destroy
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
