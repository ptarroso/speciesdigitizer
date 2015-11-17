transformMap <-
function()
### Georeferences the whole image to display with grid
{
    img <- spDigit$image
    imgPoints <- data.frame(coordinates(img), img@data)
    coordinates(imgPoints) <- ~x+y
    mapTrans <- applyTransformation(spDigit$at, imgPoints)
    assign("mapTrans", mapTrans, envir = spDigit)
}
