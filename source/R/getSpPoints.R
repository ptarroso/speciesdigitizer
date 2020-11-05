getSpPoints <-
function()
# Detects unique points based on the real coordiantes and plots
{
    imgSpPoints <- spDigit$imgSpPoints

    coordinates(imgSpPoints) <- ~x+y
    mapTransPoints <- applyTransformation(spDigit$at, imgSpPoints)
    mapTransPoints <- coordinates(mapTransPoints)

    spcX <- as.double(tclvalue(spDigit$spacingX))
    spcY <- as.double(tclvalue(spDigit$spacingY))

    mapSpPoints <- mapTransPoints
    mapSpPoints[,1] <- mapTransPoints[,1] - mapTransPoints[,1] %% spcX + spcX/2
    mapSpPoints[,2] <- mapTransPoints[,2] - mapTransPoints[,2] %% spcY + spcY/2
    mapSpPoints <- as.data.frame(unique(mapSpPoints))
    colnames(mapSpPoints) <- c("x", "y")
    assign("mapSpPoints",  mapSpPoints, envir = spDigit)

    coordinates(mapSpPoints) <- ~x+y
    imgSpPoints <- applyTransformation(spDigit$rev.at, mapSpPoints)
    assign("imgSpPoints", imgSpPoints, envir = spDigit)
    imgSpPoints <- coordinates(imgSpPoints)

    points(imgSpPoints, cex=0.6, pch=16, col='red')
}
