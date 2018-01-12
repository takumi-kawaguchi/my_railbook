class HelloController < ApplicationController
  def list
    @books = Book.all
    # render plain: MY_APP['logo']['source']
  end
end
