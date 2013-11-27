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
    @pins_ten = Pin.where(:year => '2013', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
end
