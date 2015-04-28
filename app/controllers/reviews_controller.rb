class ReviewsController < ApplicationController
  before_action :restrict_access
  before_action :find_movie, only: [:new, :create]

  def new
    @review = @movie.reviews.build
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to movie_path(@movie), notice: "Thanks for the review"
    else
      flash.now[:alert] = "Oops, something went wrong!"
      render :new
    end
  end

  private

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:rating_out_of_ten, :text)
  end
end
