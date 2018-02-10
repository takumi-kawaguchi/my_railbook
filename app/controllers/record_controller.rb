class RecordController < ApplicationController
  def page
    page_size = 3
    page_num  = params[:id] == nil ? 0 : params[:id].to_i - 1
    @books = Book.order(publish: :desc).limit(page_size).offset(page_size * page_num)
    render 'hello/list'
  end
end
