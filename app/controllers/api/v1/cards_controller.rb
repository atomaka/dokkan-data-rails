class Api::V1::CardsController < Api::V1::BaseController
  before_action :set_card, only: [:show]
  def index
    render json: Card.all, root: false
  end

  def show
    render json: @card, root: false
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end
end
