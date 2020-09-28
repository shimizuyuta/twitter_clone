class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build  # form_with 用
      @posts = current_user.microposts
      @microposts = current_user.feed_microposts
    end
  end
  

end
