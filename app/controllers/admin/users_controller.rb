class Admin::UsersController < ApplicationController
  # before_action :require_login
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :protect_self, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: t("user.create.success")
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: t("user.update.success")
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: t("user.delete.success", user: @user.full_name)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(%w{first_name last_name email password role active})
  end

  def protect_self
    if current_user == @user
      flash.alert = t("user.remove_self_attempt.failure")
      redirect_to admin_users_url
    end
  end
end
