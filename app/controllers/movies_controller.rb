class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :delete, :destroy]
  
  def index
    @movies = Movie.all.order("created_at DESC")
    @movie_of_day = Movie.offset(rand(Movie.count)).first
  end

  def show
    @review = @movie.reviews.build
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    title = @movie.title
    @movie.destroy
    flash.notice = "#{title} has been deleted."
    redirect_to movies_path
  end

  def search
    @movies = Movie.search(params[:query])
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :director, :runtime_in_minutes, :release_date, :description, :image)
  end
end
