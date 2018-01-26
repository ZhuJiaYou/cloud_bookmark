class BookmarksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    if @bookmark.save
      flash[:success] = "Bookmark created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @bookmark.destroy
    flash[:success] = "Bookmark deleted"
    redirect_to request.referrer || root_url
  end

  private

    def bookmark_params
      params.require(:bookmark).permit(:name, :url, :picture)
    end
    
    def correct_user
      @bookmark = current_user.bookmarks.find_by(id: params[:id])
      redirect_to root_url if @bookmark.nil?
    end
end
