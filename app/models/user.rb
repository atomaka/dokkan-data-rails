class User < ActiveRecord::Base
  has_paper_trail
  rolify

  after_create :set_admin, if: :first_user?

  def self.create_with_omniauth(auth)
    where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
      user.provider = auth[:provider]
      user.uid      = auth[:uid]
      user.nickname = auth[:info][:name]
      user.email    = auth[:info][:email]
    end
  end

  def admin?
    self.has_role?(:admin)
  end

  def moderator?
    self.has_role?(:moderator)
  end

  def first_user?
    User.unscoped do
      User.count == 1
    end
  end

  private

  def set_admin
    self.add_role :admin
  end
end
