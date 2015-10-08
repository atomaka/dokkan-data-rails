class Api::V1::LinksController < Api::V1::BaseController
  before_action :set_link, only: [:show]
  def index
    render json: Link.all, root: false
  end

  def show
    render json: @link, root: false
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end
end
