class ChatsController < ApplicationController

  def index
    @chats = Chat.all
  end

  def create
    # binding.pry
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
    @chat = Chat.find(params[:id])
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to chats_path, notice: "ツイートを削除しました"
  end

  def update
    @chat = Chat.find(params[:id])
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

end
