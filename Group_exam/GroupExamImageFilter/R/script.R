#' @name Image_filter
#' @title Image filter
#' @description Code as part of the group exam for filtering images
#' @param image Filepath to image in ""
#' @param filter Name of filter; red, blue, green or magenta
#' @return A filtered image
#' @examples
#' Image_filter("https://www.r-project.org/logo/Rlogo.png", green)
#' @importFrom magick image_read
#' @export

#loading libraries
library(magick)

#Main function

Image_filter <- function(image, filter){
  img <- image_read(image)
  bitmap <- img[[1]]

  obj <-  apply_filter_to_bitmap(bitmap, filter)
  image_read(obj)

}

#' @name grey
#' @title Greyscale
#' @description Code to make greyscale
#' @param rgb_vec Placeholder
#' @return Function
#' @export

# Convert a raw RGB vector to grayscale
grey <- function(rgb_vec) {
  r <- as.integer(rgb_vec[1])
  g <- as.integer(rgb_vec[2])
  b <- as.integer(rgb_vec[3])
  grey_val <- as.raw(round(0.299 * r + 0.587 * g + 0.114 * b))
  rep(grey_val, 3)
}

#' @name red
#' @title Red image
#' @description Code to make red image
#' @param rgb_vec Placeholder
#' @return Function
#' @export

# Red filter
red <- function(rgb_vec) {
  r <- rgb_vec[1]
  c(r, as.raw(0), as.raw(0))
}

#' @name green
#' @title Green image
#' @description Code to make green image
#' @param rgb_vec Placeholder
#' @return Function
#' @export

# Green filter
green <- function(rgb_vec) {
  g <- rgb_vec[2]
  c(as.raw(0), g, as.raw(0))
}

#' @name blue
#' @title Blue image
#' @description Code to make blue image
#' @param rgb_vec Placeholder
#' @return Function
#' @export

# Blue filter
blue <- function(rgb_vec) {
  b <- rgb_vec[3]
  c(as.raw(0), as.raw(0), b)
}

#' @name magenta
#' @title Magenta image
#' @description Code to make magenta image
#' @param rgb_vec Placeholder
#' @return Function
#' @export

# Replace pixel color with black or magenta based on greyscale cutoff
magenta <- function(rgb_vec, cutoff = 128) {
  r <- as.integer(rgb_vec[1])
  g <- as.integer(rgb_vec[2])
  b <- as.integer(rgb_vec[3])
  grey_val <- 0.299 * r + 0.587 * g + 0.114 * b

  if (grey_val < cutoff) {
    return(as.raw(c(0, 0, 0)))         # black: #000000
  } else {
    return(as.raw(c(255, 0, 255)))     # magenta: #FF00FF
  }
}

#' @name binary_threshold_filter
#' @title Binary filter
#' @description Code to make binary filter
#' @param rgb_vec Placeholder
#' @param cutoff Cutoff for binary filter
#' @return Raw
#' @export

# Binary threshold color filter
binary_threshold_filter <- function(rgb_vec, cutoff = 127) {
  r <- as.integer(rgb_vec[1])
  g <- as.integer(rgb_vec[2])
  b <- as.integer(rgb_vec[3])
  grey_val <- 0.299 * r + 0.587 * g + 0.114 * b
  if (grey_val > cutoff) {
    return(as.raw(c(255, 255, 255)))
  } else {
    return(as.raw(c(0, 0, 0)))
  }
}

#' @name apply_filter_to_bitmap
#' @title Bitmap filter
#' @description Code to make the bitmap filter
#' @param bitmap Bitmap created
#' @param filter_finc One of the filter functions
#' @return Bitmap
#' @export

# Apply a filter function to an entire image bitmap
apply_filter_to_bitmap <- function(bitmap, filter_func) {
  dims <- dim(bitmap)
  for (x in 1:dims[2]) {
    for (y in 1:dims[3]) {
      rgb_vec <- bitmap[, x, y]
      bitmap[, x, y] <- filter_func(rgb_vec)
    }
  }
  return(bitmap)
}
