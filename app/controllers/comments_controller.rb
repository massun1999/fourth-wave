class CommentsController < ApplicationController
  def create
    if @comment = Comment.create(comment_params)
      redirect_to "/ideas/#{@comment.idea.id}"
    else
      render "/ideas/#{@comment.idea.id}"
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    comment = Comment.find_by(id: params[:id], idea_id: params[:idea_id])
    if user_signed_in? && current_user.id == comment.user_id || comment.idea_id == @idea.id
      if comment.destroy
        redirect_to "/ideas/#{comment.idea.id}"
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, idea_id: params[:idea_id])
  end

end
