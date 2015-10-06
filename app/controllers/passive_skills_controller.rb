class PassiveSkillsController < ApplicationController
  before_action :set_passive_skill, only: [:show, :edit, :update, :destroy]

  def index
    @passive_skills = PassiveSkill.all
  end

  def show
  end

  def new
    @passive_skill = PassiveSkill.new
  end

  def create
    @passive_skill = PassiveSkill.new(passive_skill_params)

    if @passive_skill.save
      redirect_to passive_skills_path, notice: 'Passive Skill was created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @passive_skill.update(passive_skill_params)
      redirect_to passive_skills_path, notice: 'Passive Skill was updated'
    else
      render :edit
    end
  end

  def destroy
    @passive_skill.destroy

    redirect_to passive_skills_path, notice: 'Passive Skill was deleted'
  end

  private

  def passive_skill_params
    params.require(:passive_skill).permit(:name, :description)
  end

  def set_passive_skill
    @passive_skill = PassiveSkill.find(params[:id])
  end
end
