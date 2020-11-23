check <-
function()
### Displays the image with a reference grid for a final check.
{
    if (is.null(spDigit$mapTrans)) transformMap()
    crd <- coordinates(spDigit$mapTrans)
    col <- rgb(spDigit$mapTrans@data / 255)
    plot(crd, cex=0.5, pch=16, asp=1, col=col)

    spcX <- as.numeric(tclvalue(spDigit$spacingX))
    spcY <- as.numeric(tclvalue(spDigit$spacingY))

    abline(v=seq(-180, 180, spcX), col='gray')
    abline(h=seq(-90, 90, spcY), col='gray')
    abline(v=seq(-180, 180, spcX*10), col='red')
    abline(h=seq(-90, 90, spcY*10), col='red')

    points(spDigit$mapSpPoints, cex=0.5, pch=16, col='green')

}
