class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.includes(:character).all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to cards_path, notice: 'Card was created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path, notice: 'Card was updated'
    else
      render :edit
    end
  end

  def destroy
    @card.destroy

    redirect_to cards_path, notice: 'Card was deleted'
  end

  private

  def card_params
    params.require(:card).permit(:title, :character_id, :rarity_id, :type_id,
                                 :leader_skill_id, :passive_skill_id,
                                 :super_attack_id, :dokkan_id, :gameid,
                                 :awaken_type_id, :dokkan_id, link_ids: [])
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
