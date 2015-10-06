class RaritiesController < ApplicationController
  before_action :set_rarity, only: [:show, :edit, :update, :destroy]

  def index
    @rarities = Rarity.all
  end

  def show
  end

  def new
    @rarity = Rarity.new
  end

  def create
    @rarity = Rarity.new(rarity_params)

    if @rarity.save
      redirect_to rarities_path, notice: 'Rarity was created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rarity.update(rarity_params)
      redirect_to rarities_path, notice: 'Rarity was updated'
    else
      render :edit
    end
  end

  def destroy
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
