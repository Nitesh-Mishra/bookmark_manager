class BookmarksController < ApplicationController
	def index
		@bookmarks = Bookmark.all
	end

	def show
		@bookmark = Bookmark.find(params[:id])
	end

	def new
		@bookmark = Bookmark.new
	end

	def create
		@bookmark = Bookmark.new(bookmark_params)
 		@bookmark.save
 		redirect_to bookmark_path(@bookmark)
	end

	def edit
		@bookmark = Bookmark.new
		@bookmark = Bookmark.find(params[:id])
	end

	def update
  		@bookmark = Bookmark.find(params[:id])
  		@bookmark.update(bookmark_params)
  		flash.notice = "Bookmark Updated!"
		redirect_to bookmark_path(@bookmark)
	end


	def destroy
		@bookmark = Bookmark.find(params[:id])
		@bookmark.destroy
		redirect_to bookmarks_path
	end

	private

	def bookmark_params
  		params.require(:bookmark).permit(:title, :link)
	end

end
