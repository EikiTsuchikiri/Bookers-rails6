class SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		elsif @model == 'book'
			@records = Book.search_for(@content, @method)
		elsif @model == 'tag'
			@records = Tag.find_by(name: @content).books
		end
	end
end
