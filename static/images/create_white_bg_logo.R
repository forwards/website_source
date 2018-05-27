library("magrittr")
logo_path <- "https://github.com/forwards/website_source/raw/master/static/images/forwards.png"

# replace transparent background with white background
# note, this is probably not the best solution
logo <- magick::image_read(logo_path)
height <- magick::image_info(logo)$height
magick::image_blank(height, height, color = "white") %>%
  magick::image_composite(logo) %>%
  magick::image_write("white_bg_forwards.png")
