class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  def index
    # acquire all the messages
    @messages = Message.all
    @message = Message.new
  end
  
  def update
    if @message.update(message_params)
      # If successfully saved, redirect to top_page
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # If saving failed, go back to editiing page
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    else 
      # message wasn't saved
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body, :age)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
    
end
