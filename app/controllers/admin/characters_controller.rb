class Admin::CharactersController < Admin::BaseController
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @characters = Character.all

    authorize Character
  end

  def show
    authorize @character
  end

  def new
    @character = Character.new

    authorize @character
  end

  def create
    @character = Character.new(character_params)

    authorize @character

    if @character.save
      redirect_to admin_characters_path, notice: 'Character was created'
    else
      render :new
    end
  end

  def edit
    authorize @character
  end

  def update
    authorize @character

    if @character.update(character_params)
      redirect_to admin_characters_path, notice: 'Character was updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @character

    @character.destroy

    redirect_to admin_characters_path, notice: 'Character was deleted'
  end

  private

  def character_params
    params.require(:character).permit(:name)
  end

  def set_character
    @character = Character.find(params[:id])
  end
end
