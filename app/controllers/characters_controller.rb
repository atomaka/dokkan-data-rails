class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def show
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to characters_path, notice: 'Character was created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to characters_path, notice: 'Character was updated'
    else
      render :edit
    end
  end

  def destroy
    @character.destroy

    redirect_to characters_path, notice: 'Character was deleted'
  end

  private

  def character_params
    params.require(:character).permit(:name)
  end

  def set_character
    @character = Character.find(params[:id])
  end
end
