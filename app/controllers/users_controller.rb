class UsersController < ApplicationController
  def index
    @users = User.paginate page: params[:page], per_page:10
  end

  def show
    @user = User.find_by id: params[:id]
    redirect_to root_path unless @user
  end

  def new
    sign_out if signed_in?
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = t "webcome"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :avatar)
  end
end
