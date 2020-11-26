class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def create
    if @comment = Comment.create(comment_params)
      ActionCable.server.broadcast 'comment_channel', content: @comment
      redirect_to "/ideas/#{@comment.idea.id}"
    else
      render "/ideas/#{@comment.idea.id}"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    @idea_user = Idea.set_idea(comment)
    if user_signed_in? && current_user.id == comment.user_id || current_user.id == @idea_user[0]
      if comment.destroy
        redirect_to "/ideas/#{comment.idea.id}"
      end
    else
      redirect_to "/ideas/#{comment.idea.id}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, idea_id: params[:idea_id])
  end

end
