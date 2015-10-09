class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @users = User.all

    authorize User
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user

    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User was updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @user

    @user.destroy

    redirect_to admin_users_path, notice: 'User was deleted'
  end

  private

  def user_params
    params.require(:user).permit(role_ids: [])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
