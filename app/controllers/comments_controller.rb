class CommentsController < ApplicationController
  def index
    @comments = if params[:search]
                  Comment.where("content like ?", "%#{params[:search]}%")
                else
                  Comment.all.order(created_at: :desc)
                end
  end

 def create
  @comment = Comment.new(comment_params)
  @comment.save!
  render json: @comment.as_json
 end
 
 private 
 
 def comment_params
  params.require(:comment).permit(:content)
 end
end
