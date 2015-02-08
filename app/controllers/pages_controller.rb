class PagesController < ApplicationController
  def home
    @pins = Pin.all
    @pin_shuffle = Pin.all.shuffle
    @pins_rock = Pin.tagged_with('Rock').last(5)
  end

  def stats
    @pins_total = Pin.count
    @users_total = User.count
    @pins = Pin.all
    @users = User.all
    #@popular_artist = Pin.count(:all, :group => 'artist', :order => 'count(*) DESC').first
    @popular_artist = Pin.group(:artist).order('count_artist desc').count('artist').first
    @popular_album = Pin.group(:album).order('count_album desc').count('album').first
    @no_1_album = Pin.where(:rank => '1').group(:album).order('count_album desc').count('album').first
    @five_stars = Pin.where(:rating => '5').count
    @four_stars = Pin.where(:rating => '4').count
    @three_stars = Pin.where(:rating => '3').count
    @week = Pin.where('created_at >= ?', 1.week.ago.utc).count
    @user_week_count = User.joins(:pins).where('pins.created_at >= ?', 1.week.ago.utc).group(:name).order('count_name desc').count('name').first
    @user_week = User.joins(:pins).group('users.id').where('pins.created_at >= ?', 1.week.ago.utc).order('count(pins.id) desc').limit(1).first
    #@ave_rating = Pin.average('rating')
    @rating_count = Pin.group(:rating).order('count_rating desc').count('rating').first
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

  def tens2015
    @users = User.eager_load(:pins).where('pins.year=?', '2015').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2015', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end

  def tens2014
    @users = User.eager_load(:pins).where('pins.year=?', '2014').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2014', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end

  def tens2013
    @users = User.eager_load(:pins).where('pins.year=?', '2013').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2013', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2012
    @users = User.eager_load(:pins).where('pins.year=?', '2012').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2012', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end

  def five_star
    @pins = Pin.all
  end 

  def number_ones
    @pins = Pin.all
  end 

  def covers
    @pins = Pin.all

    if params[:tag]
      @pins = Pin.tagged_with(params[:tag])
    end  
  end  
end
