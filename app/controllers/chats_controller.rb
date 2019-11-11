class ChatsController < ApplicationController

  def index
    @chats = Chat.all
  end

  def create
    # binding.pry
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to chats_path, notice: "つぶやきました"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to chats_path, notice: "ツイートを削除しました"
  end

  def new
    @chat = Chat.new
  end

  def confirm
  end

  private
  def chat_params
    params.require(:chat).permit(:content)
  end

end
