class Admin::AwakenTypesController < Admin::BaseController
  before_action :set_awaken_type, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @awaken_types = AwakenType.all

    authorize AwakenType
  end

  def show
    authorize @awaken_type
  end

  def new
    @awaken_type = AwakenType.new

    authorize @awaken_type
  end

  def create
    @awaken_type = AwakenType.new(awaken_type_params)

    authorize @awaken_type

    if @awaken_type.save
      redirect_to admin_awaken_types_path, notice: 'Awaken Type was created'
    else
      render :new
    end
  end

  def edit
    authorize @awaken_type
  end

  def update
    authorize @awaken_type

    if @awaken_type.update(awaken_type_params)
      redirect_to admin_awaken_types_path, notice: 'Awaken Type was updated'
    else
      render :edit
    end
  end

  def destroy
    @awaken_type.destroy

    redirect_to admin_awaken_types_path, notice: 'Awaken Type was deleted'
  end

  private

  def awaken_type_params
    params.require(:awaken_type).permit(:name)
  end

  def set_awaken_type
    @awaken_type = AwakenType.find(params[:id])
  end
end
