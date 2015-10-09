class Admin::RaritiesController < Admin::BaseController
  before_action :set_rarity, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @rarities = Rarity.all

    authorize Rarity
  end

  def show
    authorize @rarity
  end

  def new
    @rarity = Rarity.new

    authorize @rarity
  end

  def create
    @rarity = Rarity.new(rarity_params)

    authorize @rarity

    if @rarity.save
      redirect_to rarities_path, notice: 'Rarity was created'
    else
      render :new
    end
  end

  def edit
    authorize @rarity
  end

  def update
    authorize @rarity

    if @rarity.update(rarity_params)
      redirect_to rarities_path, notice: 'Rarity was updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @rarity

    @rarity.destroy

    redirect_to rarities_path, notice: 'Rarity was deleted'
  end

  private

  def rarity_params
    params.require(:rarity).permit(:name, :description)
  end

  def set_rarity
    @rarity = Rarity.find(params[:id])
  end
end
