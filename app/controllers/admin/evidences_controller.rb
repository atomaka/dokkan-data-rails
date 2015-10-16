class Admin::EvidencesController < Admin::BaseController
  def index
    @evidences = Evidence.all
  end

  def new
    @evidence = Evidence.new
  end

  def create
    evidence = params[:evidence][:screenshot]

    if evidence.size > 10
      @evidence = Evidence.new
      flash.now[:notice] = 'Only 10 evidence can be submitted at once'
      render :new
    else
      evidence.each do |screenshot|
        Evidence.new(screenshot: screenshot).save
      end

      redirect_to admin_evidences_path, notice: 'Evidence was created'
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
