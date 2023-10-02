class Admin::UsersController < ApplicationController
<<<<<<< HEAD
  def index
    @use
=======
  before_action :require_admin

  def index
    @user = User.all
>>>>>>> cc6fe40bbfa09f0aa1fa3674b29e0f603a179346
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
<<<<<<< HEAD
    @user = User.find(params[[:id]])
=======
    @user = User.find(params[:id])
>>>>>>> cc6fe40bbfa09f0aa1fa3674b29e0f603a179346
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user), notice: "ユーザ「#{@user.name}」を登録"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

<<<<<<< HEAD
    if  @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザ 「#{@user.name}」を更新しました。"
=======
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザ「#{@user.name}」を更新しました。"
>>>>>>> cc6fe40bbfa09f0aa1fa3674b29e0f603a179346
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
<<<<<<< HEAD
    redirect_to admin_users_url, notice: "ユーザ 「#{@user.name}」を削除しました。"
  end

=======
    redirect_to admin_user_url, notice: "ユーザ「#{@user.name}」を削除しました。"
  end
>>>>>>> cc6fe40bbfa09f0aa1fa3674b29e0f603a179346
  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
