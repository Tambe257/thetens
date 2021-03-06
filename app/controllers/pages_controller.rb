class PagesController < ApplicationController
  def artists
    @pin_albums = Pin.all.order(:artist).group_by{ |x| [x.artist, x.album]}  
    @pin_all = Pin.all
    @pins_total = Pin.count
    @artist_count = Pin.group(:artist).count.length
    @album_count = Pin.group(:album).count.length
    @popular_artist = Pin.group(:artist).order('count_artist desc').count('artist').first
    @popular_album = Pin.group(:album).order('count_album desc').count('album').first
    @rating_count = Pin.group(:rating).order('count_rating desc').count('rating').first
    @five_stars = Pin.where(:rating => '5').count
    @four_stars = Pin.where(:rating => '4').count
    @three_stars = Pin.where(:rating => '3').count
    @no_1_album = Pin.where(:rank => '1').group(:album).order('count_album desc').count('album').first
  end
    
  def home
    @pins = Pin.all
    @pin_shuffle = Pin.all.shuffle
    @pins_rock = Pin.tagged_with('Rock').order('pins.created_at desc').limit(5)
    @pins_pop = Pin.tagged_with('Pop').order('pins.created_at desc').limit(5)
    @pins_rap = Pin.tagged_with('Rap').order('pins.created_at desc').limit(5)
    @pins_alternative = Pin.tagged_with('Alternative').order('pins.created_at desc').limit(5)
    @pins_newest = Pin.last(5).reverse
    @rating_count = Pin.group(:rating).order('count_rating desc').count('rating').first
    @user_week_count = User.joins(:pins).where('pins.created_at >= ?', 1.week.ago.utc).group(:name).order('count_name desc').count('name').first
    @user_week = User.joins(:pins).group('users.id').where('pins.created_at >= ?', 1.week.ago.utc).order('count(pins.id) desc').limit(1).first
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
  	@users = User.eager_load(:pins).order('pins_count desc')
  end	

  def comments_board
  	@comments = Comment.all
  end

  def blog_comments_board
    @blog_comments = BlogComment.all
  end

  def tens2018
    @users = User.eager_load(:pins).where('pins.year=?', '2018').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2018', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2017
    @users = User.eager_load(:pins).where('pins.year=?', '2017').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2017', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2016
    @users = User.eager_load(:pins).where('pins.year=?', '2016').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2016', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
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
  
  def tens2011
    @users = User.eager_load(:pins).where('pins.year=?', '2011').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2011', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2010
    @users = User.eager_load(:pins).where('pins.year=?', '2010').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2010', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2009
    @users = User.eager_load(:pins).where('pins.year=?', '2009').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2009', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2008
    @users = User.eager_load(:pins).where('pins.year=?', '2008').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2008', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2007
    @users = User.eager_load(:pins).where('pins.year=?', '2007').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2007', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2006
    @users = User.eager_load(:pins).where('pins.year=?', '2006').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2006', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2005
    @users = User.eager_load(:pins).where('pins.year=?', '2005').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2005', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2004
    @users = User.eager_load(:pins).where('pins.year=?', '2004').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2004', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2003
    @users = User.eager_load(:pins).where('pins.year=?', '2003').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2003', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2002
    @users = User.eager_load(:pins).where('pins.year=?', '2002').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2002', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2001
    @users = User.eager_load(:pins).where('pins.year=?', '2001').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2001', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
  end
  
  def tens2000
    @users = User.eager_load(:pins).where('pins.year=?', '2000').where.not('pins.rank' => nil)
    @pins = Pin.all
    @pins_ten = Pin.where(:year => '2000', :rank => ['10', '9', '8', '7', '6', '5', '4', '3', '2', '1'], :rank => !nil)
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
