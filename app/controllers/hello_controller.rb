class HelloController < ApplicationController
  before_action :check_logined, only: :view

  def index
    @message = "ここはhello#index"
  end

  def list
    @books = Book.all
    @bs    = Book.whats_new("技術評論社")
  end

  def view
  end

  private

  def check_logined
    if session[:usr]
      begin
        @usr = User.find(session[:usr])
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end

    unless @usr
      flash[:referer] = request.fullpath
      redirect_to controller: :login, action: :index
    end
  end
end
