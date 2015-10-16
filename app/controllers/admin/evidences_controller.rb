class Admin::EvidencesController < Admin::BaseController
  def index
    @evidences = Evidence.all
  end

  def new
    @evidence = Evidence.new
  end

  def create
    params[:evidence][:screenshot].each do |screenshot|
      Evidence.new(screenshot: screenshot).save
    end

    redirect_to admin_evidences_path, notice: 'Evidence was created'
  end

  def destroy
    @evidence = Evidence.find(params[:id])

    @evidence.destroy

    redirect_to admin_evidences_path, notice: 'Evidence was deleted'
  end

  private

  def evidence_params
    params.require(:evidence).permit(:screenshot)
  end
end
