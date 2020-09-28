class FavoritesController < ApplicationController
  before_action :current_user
  def create
    
    micropost = Micropost.find(params[:id])
    current_user.favorite(micropost)
    
    flash[:success] = 'このメッセージお気に入り'
  
    redirect_to root_url

  end

  def destroy
    micropost = Micropost.find(params[:id])
    current_user.unfavorite(micropost)
    
      flash[:sucess] = '削除しました'
      redirect_to root_url
  end
end
