class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @cards = Card.includes(:character).all

    authorize Card
  end

  def show
    authorize @card
  end

  def new
    @card = Card.new

    authorize @card
  end

  def create
    @card = Card.new(card_params)

    authorize @card

    if @card.save
      redirect_to cards_path, notice: 'Card was created'
    else
      render :new
    end
  end

  def edit
    authorize @card
  end

  def update
    authorize @card

    if @card.update(card_params)
      redirect_to cards_path, notice: 'Card was updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @card

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
