class Admin::LeaderSkillsController < Admin::BaseController
  before_action :set_leader_skill, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @leader_skills = LeaderSkill.all

    authorize LeaderSkill
  end

  def show
    authorize @leader_skill
  end

  def new
    @leader_skill = LeaderSkill.new

    authorize @leader_skill
  end

  def create
    @leader_skill = LeaderSkill.new(leader_skill_params)

    authorize @leader_skill

    if @leader_skill.save
      redirect_to admin_leader_skills_path, notice: 'Leader Skill was created'
    else
      render :new
    end
  end

  def edit
    authorize @leader_skill
  end

  def update
    authorize @leader_skill

    if @leader_skill.update(leader_skill_params)
      redirect_to admin_leader_skills_path, notice: 'Leader Skill was updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @leader_skill

    @leader_skill.destroy

    redirect_to admin_leader_skills_path, notice: 'Leader Skills was deleted'
  end

  private

  def leader_skill_params
    params.require(:leader_skill).permit(:description)
  end

  def set_leader_skill
    @leader_skill = LeaderSkill.find(params[:id])
  end
end
