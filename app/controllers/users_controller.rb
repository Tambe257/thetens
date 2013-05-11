class UsersController < ApplicationController
	def show
    @user = User.find(params[:id])
    @pins = @user.pins.paginate(:page => params[:page], :per_page => 20)
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pins }
      format.js
    end
	end

	def tens2007
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(20)
	end

	def tens2008
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(20)
	end

	def tens2009
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(20)
	end

	def tens2010
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(20)
	end

	def tens2011
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(20)
	end

	def tens2012
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(20)
	end

	def tens2013
    @user = User.find(params[:id])
    @pins = @user.pins.page(params[:page]).per_page(20)
	end
end
