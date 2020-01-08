class Api::V1::MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: movies, status: 200
  end

  def show
    movie = Movie.find_by(:id => params[:id])
    render json: movie
  end
  
  def create
    movie = Movie.create(move_params)
    render json: movie, status: 200
  end
  
  def update
    movie = Movie.find_by(:id => params[:id])
    movie.update(movie_params)
  end
  
  def destroy
    movie = Movie.find_by(:id => params[:id])
    movie.delete
    render json: {movieId: movie.id}

  end
  private
  def movie_params
    params.require(:movie).permit(:title)
  end


end
