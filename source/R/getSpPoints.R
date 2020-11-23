getSpPoints <-
function()
# Detects unique points based on the real coordiantes and plots
{
    imgSpPoints <- spDigit$imgSpPoints

    coordinates(imgSpPoints) <- ~x+y
    mapTransPoints <- applyTransformation(spDigit$at, imgSpPoints)
    mapTransPoints <- coordinates(mapTransPoints)

    mapSpPoints <- grdCenter(mapTransPoints)
    colnames(mapSpPoints) <- c("x", "y")

    assign("mapSpPoints",  mapSpPoints, envir = spDigit)

    coordinates(mapSpPoints) <- ~x+y
    imgSpPoints <- applyTransformation(spDigit$rev.at, mapSpPoints)
    assign("imgSpPoints", imgSpPoints, envir = spDigit)
    imgSpPoints <- coordinates(imgSpPoints)

    points(imgSpPoints, cex=0.6, pch=16, col='red')
}
