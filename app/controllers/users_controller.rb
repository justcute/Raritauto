class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.search(params[:search]).order(:role).reverse_order.page(params[:page])
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    user = User.find(params[:id])
    authorize User
    user.destroy
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update(secure_params)
      redirect_to users_path, :success => 'Пользователь обновлён'
    else
      redirect_to users_path, :alert => 'Невозможно обновить пользователя'
    end
  end


  private
    def secure_params
      params.require(:user).permit(:role, :search)
    end
end
