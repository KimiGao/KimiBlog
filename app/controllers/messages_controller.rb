class MessagesController < ApplicationController
  before_filter :get_recent_posts

<<<<<<< HEAD
  #caches_page :index,:messages_list
=======
  #留言板
>>>>>>> 590d412dfde076fe024a51cddf1dd618d1bae428
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

  #留言版留言
  def comment
    @message = Message.new(params[:message])

    if @message.save
      redirect_to('/messages#center')
    end
  end
end
