class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @users = User.all.paginate(page: params[:page])
  end
  def show
    @user = User.find(params[:id])
    @ads_for_current_user = Ad.where(:user_id => current_user.id).paginate(:page => params[:page]) if current_user!=nil
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Успешная регистрация"
      redirect_to @user
    else
      flash[:error] = "Retry"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    puts params
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:danger] = "Error"
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

end
