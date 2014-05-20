class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  # POST /comments
  # POST /comments.json
  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create(params[:comment])
    @comment.user = current_user


    MyMailer.comment_email(@pin.user).deliver

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @pin, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
        
        @commenter = @pin.comments.collect(&:user)
        @commenter = @commenter.uniq
        
        @commenter.each do |commenter|  
          MyMailer.commenter_email(commenter).deliver
        end  
      
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end