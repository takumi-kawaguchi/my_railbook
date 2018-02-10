class HelloController < ApplicationController
  def list
    @books = Book.all
    @bs    = Book.whats_new("技術評論社")
  end
end
