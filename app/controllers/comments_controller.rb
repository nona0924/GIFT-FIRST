class CommentsController < ApplicationController
    
    def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to("/boards/#{@comment.board_id}")
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
   def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to("/boards/#{@comment.board_id}")
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :board_id, :reply_comment)
  end

end
