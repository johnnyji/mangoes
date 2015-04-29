module MoviesHelper

  def display_image(image)
    if movie.image.nil?
      image_tag("/assets/images/fallback/fallback.jpg")
    else
      image_tag(image)
    end
  end

  def formatted_date(date)
    date.strftime("%b, %d, %Y")
  end
end
