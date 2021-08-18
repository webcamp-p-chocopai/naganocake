class Admin::ItemsController < ApplicationController
  
  def show
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    blog = Blog.new(blog_params)
    blog.save
    redirect_to blogs_path
  end
  
  def edit
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end

end
