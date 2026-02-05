class UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(8)
    @following_users = @user.followers   # ← フォローしている人（フォロー一覧に出したい）
    @follower_users  = @user.followeds
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "更新しました"
    else
      render :edit
    end
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page])   # ←ここを followers に
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followeds.page(params[:page])   # ←ここを followeds に
  end
  
  

  private

  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end
