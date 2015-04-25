class PinsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  require 'will_paginate/array'
  # GET /pins
  # GET /pins.json
  def index
    if params[:search]
      @pins = Pin.search(params[:search]).paginate(:page => params[:page], :per_page => 50)
    elsif params[:tag]
      @pins = Pin.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 50)
    else  
      @pins = Pin.paginate(:page => params[:page], :per_page => 50).order("created_at DESC")
    end  

    @tags = Pin.tag_counts.order('name asc')
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pins }
      # format.js
    end
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
    @pin = Pin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pin }
      format.js
    end
  end
 

  # GET /pins/new
  # GET /pins/new.json
  def new
    @pin = current_user.pins.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pin }
    end
  end

  def copy
    @source = Pin.find(params[:id])
    @image = @source.image
    @image_url = @source.image.url
    @pin = Pin.new(artist: @source.artist, album: @source.album, year: @source.year, image_remote_url: @image.to_s)
    render 'copy'
  end

  # GET /pins/1/edit
  def edit
    @pin = Pin.find_for_user(params[:id], current_user)    
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = current_user.pins.new(params[:pin])

    respond_to do |format|
      if @pin.save
        MyMailer.post_alert(@pin).deliver
        format.html { redirect_to root_path, notice: 'Your review was successfully posted.' }
        format.json { render json: @pin, status: :created, location: @pin }
      else
        format.html { render action: "new" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pins/1
  # PUT /pins/1.json
  def update
    @pin = Pin.find_for_user(params[:id], current_user)

    respond_to do |format|
      if @pin.update_attributes(params[:pin])
        format.html { redirect_to @pin, notice: 'Your review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy

    respond_to do |format|
      format.html { redirect_to pins_url }
      format.json { head :no_content }
    end
  end

  def tag_cloud
    @tags = Pin.tag_counts_on(:tags)
  end
end

