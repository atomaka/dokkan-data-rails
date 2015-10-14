class Admin::VersionsController < Admin::BaseController
  def show
    @version = PaperTrail::Version.find(params[:id]).reify(has_one: true)

    type = @version.class.to_s.underscore
    instance_variable_set('@' + type, @version)

    render "admin/#{type.pluralize}/show"
  end

  def revert
    @version = PaperTrail::Version.find(params[:id])

    if @version.reify(has_one: true)
      @version.reify(has_one: true).save!
    else
      @version.item.destroy
    end

    redirect_to :back, notice: "Undid #{@version.event}!"
  end

  private

  def set_version
  end
end
