class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]


  def index
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.all
    counts(@user)

 
  end

  def new
    @user = User.new
    
  end
  def create
    
    @user = User.new(user_params)
    
    if @user.save
      
      flash[:success] ="#{@user.name}さん登録完了"
      redirect_to @user
    else
      flash.now[:danger] = "#{@user.name}さん登録失敗"
      render :new
    end
  end
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings 
    counts(@user)
  end
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
    counts(@user)
  end
  def favorite
    @user = User.find(params[:id])
    @favorites = @user.fav_all
    counts(@user)
  end



  private
  def user_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation)
  end
end
