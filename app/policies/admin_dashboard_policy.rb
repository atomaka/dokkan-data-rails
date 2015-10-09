class AdminDashboardPolicy < Struct.new(:user, :admin_dashbard)
  def index?
    user.admin? || user.moderator?
  end
end
