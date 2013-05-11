class UsersController < ApplicationController
	def show
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
