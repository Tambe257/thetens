class PagesController < ApplicationController
  def home
  end

  def stats
    @pins_total = Pin.count
    @users_total = User.count
    @pins = Pin.all
    @users = User.all
    @popular_artist = Pin.count(:all, :group => 'artist', :order => 'count(*) DESC').first
    @popular_album = Pin.count(:all, :group => 'album', :order => 'count(*) DESC').first
    @no_1_album = Pin.where(:rank => '1').count(:all, :group => 'album', :order => 'count(*) DESC').first
    @five_stars = Pin.where(:rating => '5').count
    @four_stars = Pin.where(:rating => '4').count
    @three_stars = Pin.where(:rating => '3').count
    @week = Pin.where('created_at >= ?', 1.week.ago.utc).count
    @user_week_count = User.joins(:pins).where('pins.created_at >= ?', 1.week.ago.utc).count(:all, :group => 'name', :order => 'count(*) DESC').first
    @user_week = User.joins(:pins).group('users.id').where('pins.created_at >= ?', 1.week.ago.utc).order('count(pins.id) desc').limit(1).first
    #@ave_rating = Pin.average('rating')
    @rating_count = Pin.count(:all, :group => 'rating', :order => 'count(*) DESC').first
  end

  def reviewers
  	@users = User.all
  end	

  def comments_board
  	@comments = Comment.all
  end

  def blog_comments_board
    @blog_comments = BlogComment.all
  end

  def tens2014
    @users = User.includes(:pins).where('pins.year=?', '2014')
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2014', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end

  def tens2013
    @users = User.includes(:pins).where('pins.year=?', '2013')
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2013', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2012
    @users = User.includes(:pins).where('pins.year=?', '2012')
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2012', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end

  def five_star
    @pins = Pin.all
  end 

  def number_ones
    @pins = Pin.all
  end 
end
