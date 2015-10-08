class PassiveSkillPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.moderator? || user.admin?
  end

  def update?
    user.moderator? || user.admin?
  end

  def destroy?
    user.moderator? || user.admin?
  end
end
