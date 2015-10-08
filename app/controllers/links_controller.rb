class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @links = Link.all

    authorize Link
  end

  def show
    authorize @link
  end

  def new
    @link = Link.new

    authorize @link
  end

  def create
    @link = Link.new(link_params)

    authorize @link

    if @link.save
      redirect_to links_path, notice: 'Link was created'
    else
      render :new
    end
  end

  def edit
    authorize @link
  end

  def update
    authorize @link

    if @link.update(link_params)
      redirect_to links_path, notice: 'Link was updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @link

    @link.destroy

    redirect_to links_path, notice: 'Link was deleted'
  end

  private

  def link_params
    params.require(:link).permit(:name, :description)
  end

  def set_link
    @link = Link.find(params[:id])
  end
end
