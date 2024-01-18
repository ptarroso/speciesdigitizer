transformMap <-
function()
### Georeferences the whole image to display with grid
{
    img <- spDigit$image
    imgDF <- terra::as.data.frame(img, xy=TRUE, na.rm=FALSE)

    # Note: converting between sf <-> sp because of vec2dtransf dependecies
    #       Need to change whenever the vec2dtrans library updates to sf.
    imgPoints <- sf::st_as_sf(imgDF, coords = c("x","y"))
    mapTrans <- vec2dtransf::applyTransformation(spDigit$at,
                                                  as(imgPoints, "Spatial"))
    crd <- sf::st_coordinates(sf::st_as_sf(mapTrans))

    # Transform the grid by adjusting each cell to the expected centroid on the
    # average spatial resolution on each axis
    sz <- dim(img)[2:1] - 1
    resX <- diff(range(crd[,1]))/sz[1]
    resY <- diff(range(crd[,2]))/sz[2]
    crd[,1] <- crd[,1]-crd[,1]%%resX + resX/2
    crd[,2] <- crd[,2]-crd[,2]%%resY + resY/2

    # Convert to raster
    imgDF[,1:2] <- crd
    rst <- terra::rast(imgDF)
    terra::RGB(rst) <- 1:3

    assign("mapTrans", rst, envir = spDigit)
}
