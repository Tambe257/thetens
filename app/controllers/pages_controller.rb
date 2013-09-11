class PagesController < ApplicationController
  def home
  end

  def about
  end

  def reviewers
  	@users = User.all
  end	

  def comments_board
  	@comments = Comment.all
  end
end
