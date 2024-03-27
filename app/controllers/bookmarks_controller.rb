class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @bookmark = current_user.bookmarks.new(post: @post)
  
    if @bookmark.save
      redirect_to @bookmark.post, notice: 'Post Bookmarked'
    else
      redirect_to @bookmark.post, alert: 'Unable to bookmark post'
    end
  end

  def destroy
      @bookmark = current_user.bookmarks.find(params[:id])
      @bookmark.destroy
      redirect_to @bookmark.post, notice: 'Post unmarked'
  end

end
