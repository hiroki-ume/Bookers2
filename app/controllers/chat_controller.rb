class ChatController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @chats = @room.chats
  end
end
