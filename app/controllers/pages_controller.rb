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

  def tens2013
    @users = User.includes(:pins).where('pins.year=?', '2013')
    @pins = Pin.all
  end
  
end
