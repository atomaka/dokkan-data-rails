class Api::V1::CardsController < Api::V1::BaseController
  before_action :set_card, only: [:show]
  def index
    @cards = Rails.cache.fetch('api_all_cards', expires_in: 2.minutes) do
      Card.includes(:character, :rarity, :type, :leader_skill,
                    :passive_skill, :super_attack, :awaken_type,
                    :dokkan_card, :hp_stat, :atk_stat, :def_stat,
                    :links)
    end

    render json: @cards, root: false
  end

  def show
    render json: @card, root: false
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end
end
