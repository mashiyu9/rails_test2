class ChatsController < ApplicationController

  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  def index
    @chats = Chat.all
  end

  def create
    @chat = Chat.new(chat_params)
    if params[:back]
      render :new
    else
      if @chat.save
        redirect_to chats_path, notice: "つぶやきました"
      else
        render "new"
      end
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @chat.destroy
    redirect_to chats_path, notice: "ツイートを削除しました"
  end

  def update
    if @chat.update(chat_params)
      redirect_to chats_path, notice: "つぶやきを編集しました"
    else
      render :edit
    end
  end

  def new
    @chat = Chat.new
  end

  def confirm
    @chat = Chat.new(chat_params)
    render :new if @chat.invalid?
  end

  private

  def chat_params
    params.require(:chat).permit(:content)
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end

end
