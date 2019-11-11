class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def new
    @chat = Chat.new
  end
end
