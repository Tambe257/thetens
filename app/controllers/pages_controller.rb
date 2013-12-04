class PagesController < ApplicationController
  def home
  end

  def about
    @pins_total = Pin.count
    @users_total = User.count
    @pins = Pin.all
    @popular_artist = Pin.count(:all, :group => 'artist', :order => 'count(*) DESC').first
    @popular_album = Pin.count(:all, :group => 'album', :order => 'count(*) DESC').first
    @five_stars = Pin.count(:all, :group => 'rating', :order => 'count(*) DESC').first

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
