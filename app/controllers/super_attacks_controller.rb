class SuperAttacksController < ApplicationController
  before_action :set_super_attack, only: [:show, :edit, :update, :destroy]

  def index
    @super_attacks = SuperAttack.all
  end

  def show
  end

  def new
    @super_attack = SuperAttack.new
  end

  def create
    @super_attack = SuperAttack.new(super_attack_params)

    if @super_attack.save
      redirect_to super_attacks_path, notice: 'Super Attack was created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @super_attack.update(super_attack_params)
      redirect_to super_attacks_path, notice: 'Super Attack was updated'
    else
      render :edit
    end
  end

  def destroy
    @super_attack.destroy

    redirect_to super_attacks_path, notice: 'Super Attack was deleted'
  end

  private

  def super_attack_params
    params.require(:super_attack).permit(:name, :description)
  end

  def set_super_attack
    @super_attack = SuperAttack.find(params[:id])
  end
end
