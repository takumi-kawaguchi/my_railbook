class ViewController < ApplicationController
  def form_tag
    @book = Book.new
  end

  def form_for
    @book = Book.find(1)
  end

  def field
    @book = Book.new
  end

  def html5
    @book = Book.new
  end

  def select
    @book = Book.new
  end

  def col_select
    # @book  = Book.new(publish: '秀和システム')
    @books = Book.select(:publish).distinct
  end

  def group_select
    @review  = Review.new
    @authors = Author.all
  end

  def col_radio
    @book  = Book.new
    @books = Book.select(:publish).distinct
  end

  def fields
    @user = User.find(1)
  end

  def simple_format
  end
end
