class Admin::CardsController < Admin::BaseController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @cards = Card.includes(:character).all.order(updated_at: :desc)

    authorize Card
  end

  def show
    authorize @card
  end

  def new
    @card = Card.new
    @card.build_hp_stat
    @card.build_atk_stat
    @card.build_def_stat
    @card.build_cost_stat

    authorize @card
  end

  def create
    @card = Card.new(card_params)

    authorize @card

    if @card.save
      redirect_to admin_cards_path,
        notice: "Card was created. #{undo_link(@card)}"
    else
      render :new
    end
  end

  def edit
    authorize @card

    @versions = @card.versions
  end

  def update
    authorize @card

    if @card.update(card_params)
      redirect_to admin_cards_path,
        notice: "Card was updated. #{undo_link(@card)}"
    else
      render :edit
    end
  end

  def destroy
    authorize @card

    @card.destroy

    redirect_to admin_cards_path,
      notice: "Card was deleted. #{undo_link(@card)}"
  end

  private

  def card_params
    params
      .require(:card)
      .permit(:title, :character_id, :rarity_id, :type_id, :leader_skill_id,
              :passive_skill_id, :verified, :super_attack_id, :dokkan_id,
              :gameid, :awaken_type_id, :dokkan_id, evidence_ids: [],
              link_ids: [],
              hp_stat_attributes: [:min, :max, :awaken_min, :awaken_max],
              atk_stat_attributes: [:min, :max, :awaken_min, :awaken_max],
              def_stat_attributes: [:min, :max, :awaken_min, :awaken_max],
              cost_stat_attributes: [:min, :max, :awaken_min, :awaken_max]
             )
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
