class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
      user.provider = auth[:provider]
      user.uid      = auth[:uid]
      user.nickname = auth[:info][:name]
      user.email    = auth[:info][:email]
    end
  end
end