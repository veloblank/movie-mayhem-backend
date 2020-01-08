class Api::V1::MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: movies, status: 200
  end

  def show
    movie = Movie.find_by(:id => params[:id])
    if movie
      render json: movie, status: 200
    else
      render json: {message: "The requested movie could not be found."}
    end
  end
  
  def create
    movie = Movie.new(movie_params)
    if movie.valid?
      movie.save
      render json: movie, status: 200
    else
      render json: {message: "The resource could not be created."}
    end
  end
  
  def update
    movie = Movie.find_by(:id => params[:id])
    if movie && movie.update(movie_params)
      render json: movie, status: 200
    else
      render json: {message: "The requested movie resource could not be updated."}
    end
  end
  
  def destroy
    movie = Movie.find_by(:id => params[:id])
    if movie
      movie.delete
      render json: {movieId: movie.id}
    else
      render json: {message: "The requested resource could not be deleted."}
    end
  end
  
  private
  def movie_params
    params.require(:movie).permit(:title, :synopsis, :rating, :poster_src)
  end


end
