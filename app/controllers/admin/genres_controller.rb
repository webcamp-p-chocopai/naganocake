class Admin::GenresController < ApplicationController
  
  def index
    @genre = Genres.new
    @genres = Genres.all
    @genre_page = Genres.all.page(params[:page])
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @genre = Genres.find(params[:id])
  end
  
  def update
    @genre = Genres.find(params[:id])
    @genres = Genres.update(genre_params)
    redirect_to admin_genres_path
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:genre_name )
  end
  
  
end
