class LeaderSkillsController < ApplicationController
  before_action :set_leader_skill, only: [:show, :edit, :update, :destroy]

  def index
    @leader_skills = LeaderSkill.all
  end

  def show
  end

  def new
    @leader_skill = LeaderSkill.new
  end

  def create
    @leader_skill = LeaderSkill.new(leader_skill_params)

    if @leader_skill.save
      redirect_to leader_skills_path, notice: 'Leader Skill was created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @leader_skill.update(leader_skill_params)
      redirect_to leader_skills_path, notice: 'Leader Skill was updated'
    else
      render :edit
    end
  end

  def destroy
    @leader_skill.destroy

    redirect_to leader_skills_path, notice: 'Leader Skills was deleted'
  end

  private

  def leader_skill_params
    params.require(:leader_skill).permit(:description)
  end

  def set_leader_skill
    @leader_skill = LeaderSkill.find(params[:id])
  end
end