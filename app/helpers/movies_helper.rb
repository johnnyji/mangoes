module MoviesHelper

  def display_image(image)
    if movie.image.nil?
      image_tag("/assets/images/fallback/fallback.jpg")
    else
      image_tag(image)
    end
  end

  def formatted_date(date)
    date.strftime("%b %d, %Y")
  end

  # def original_poster(movie)
  #   current_user == movie.
  # end
end
