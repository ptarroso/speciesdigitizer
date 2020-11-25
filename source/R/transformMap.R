transformMap <-
function()
### Georeferences the whole image to display with grid
{
  img <- spDigit$image
  imgPoints <- data.frame(coordinates(img), img@data)
  coordinates(imgPoints) <- ~x+y
  mapTrans <- applyTransformation(spDigit$at, imgPoints)

  # Transform the grid by adjusting each cell to the expected centroid on the
  # average spatial resolution on each axis
  sz <- spDigit$image@grid@cells.dim
  crd <- coordinates(mapTrans)
  resX <- diff(range(crd[,1]))/sz[1]
  resY <- diff(range(crd[,2]))/sz[2]
  crd[,1] <- crd[,1]-crd[,1]%%resX + resX/2
  crd[,2] <- crd[,2]-crd[,2]%%resY + resY/2
  dt <- mapTrans@data
  coordinates(dt) <- crd
  gridded(dt) <- TRUE

  assign("mapTrans", dt, envir = spDigit)
}
