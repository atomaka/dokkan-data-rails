class Admin::SuperAttacksController < Admin::BaseController
  before_action :set_super_attack, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @super_attacks = SuperAttack.all

    authorize SuperAttack
  end

  def show
    authorize @super_attack
  end

  def new
    @super_attack = SuperAttack.new

    authorize @super_attack
  end

  def create
    @super_attack = SuperAttack.new(super_attack_params)

    authorize @super_attack

    if @super_attack.save
      redirect_to admin_super_attacks_path, notice: 'Super Attack was created'
    else
      render :new
    end
  end

  def edit
    authorize @super_attack
  end

  def update
    authorize @super_attack

    if @super_attack.update(super_attack_params)
      redirect_to admin_super_attacks_path, notice: 'Super Attack was updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @super_attack

    @super_attack.destroy

    redirect_to admin_super_attacks_path, notice: 'Super Attack was deleted'
  end

  private

  def super_attack_params
    params.require(:super_attack).permit(:name, :description)
  end

  def set_super_attack
    @super_attack = SuperAttack.find(params[:id])
  end
end
