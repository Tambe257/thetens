class UsersController < ApplicationController
	def show
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2000
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2001
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2002
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2003
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2004
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2005
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2006
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2007
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2008
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2009
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2010
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2011
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2012
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end

	def tens2013
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(50)
	end
end
