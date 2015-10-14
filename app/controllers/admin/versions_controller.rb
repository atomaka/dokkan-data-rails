class Admin::VersionsController < Admin::BaseController
  before_action :set_version, only: [:show]

  def show
    type = @version.class.to_s.underscore
    instance_variable_set('@' + type, @version)

    render "admin/#{type.pluralize}/show"
  end

  private

  def set_version
    @version = PaperTrail::Version.find(params[:id]).reify(has_one: true)
  end
end
