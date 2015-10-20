class Admin::StatTypesController < Admin::BaseController
  before_action :set_stat_type, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @stat_types = StatType.all
    authorize StatType
  end

  def show
    authorize @stat_type
  end

  def new
    @stat_type = StatType.new

    authorize @stat_type
  end

  def create
    @stat_type = StatType.new(stat_type_params)

    authorize @stat_type

    if @stat_type.save
      redirect_to admin_stat_types_path, notice: 'StatType was created'
    else
      render :new
    end
  end

  def edit
    authorize @stat_type
  end

  def update
    authorize @stat_type

    if @stat_type.update(stat_type_params)
      redirect_to admin_stat_types_path, notice: 'StatType was updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @stat_type

    @stat_type.destroy

    redirect_to admin_stat_types_path, notice: 'StatType was deleted'
  end

  private

  def stat_type_params
    params.require(:stat_type).permit(:name, :description)
  end

  def set_stat_type
    @stat_type = StatType.find(params[:id])
  end
end
