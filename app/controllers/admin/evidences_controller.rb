class Admin::EvidencesController < Admin::BaseController
  def index
    @evidences = Evidence.all
  end

  def new
    @evidence = Evidence.new
  end

  def create
    @evidence = Evidence.new(evidence_params)

    if @evidence.save
      redirect_to admin_evidences_path, notice: 'Evidence was created'
    else
      render :new
    end
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
