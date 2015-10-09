class Admin::PassiveSkillsController < Admin::BaseController
  before_action :set_passive_skill, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @passive_skills = PassiveSkill.all

    authorize PassiveSkill
  end

  def show
    authorize @passive_skill
  end

  def new
    @passive_skill = PassiveSkill.new

    authorize @passive_skill
  end

  def create
    @passive_skill = PassiveSkill.new(passive_skill_params)

    authorize @passive_skill

    if @passive_skill.save
      redirect_to admin_passive_skills_path, notice: 'Passive Skill was created'
    else
      render :new
    end
  end

  def edit
    authorize @passive_skill
  end

  def update
    authorize @passive_skill

    if @passive_skill.update(passive_skill_params)
      redirect_to admin_passive_skills_path, notice: 'Passive Skill was updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @passive_skill

    @passive_skill.destroy

    redirect_to admin_passive_skills_path, notice: 'Passive Skill was deleted'
  end

  private

  def passive_skill_params
    params.require(:passive_skill).permit(:name, :description)
  end

  def set_passive_skill
    @passive_skill = PassiveSkill.find(params[:id])
  end
end
