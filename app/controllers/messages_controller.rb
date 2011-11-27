class MessagesController < ApplicationController
  before_filter :get_recent_posts

  #caches_page :index,:messages_list
  def index
    @messages = Message.board
    @message = Message.new
  end

  def messages_list
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def comment
    @message = Message.new(params[:message])

    if @message.save
      redirect_to('/messages#center')
    end
  end
end
