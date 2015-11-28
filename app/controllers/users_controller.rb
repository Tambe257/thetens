class UsersController < ApplicationController
	def show
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
    @rating_count = @user.pins.group("rating").count(:order => 'count(*) DESC')
	end

	def tens2000
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2001
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2002
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2003
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2004
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2005
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2006
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2007
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2008
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2009
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2010
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2011
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2012
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2013
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2014
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

    def tens2015
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end
  
	def tens5star
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end
	
	def tensnum1s
    @user = User.friendly.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end
end
