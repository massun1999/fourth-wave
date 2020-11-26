class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
      ActionCable.server.broadcast 'message_channel', content: @message
    end
    redirect_to room_path(@message.room_id)
  end




  private

  def message_params
    params.require(:message).permit(:content, :user_id, :room_id).merge(user_id: current_user.id)
  end

end
