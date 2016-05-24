check <-
function()
### Displays the image with a reference grid for a final check.
{
    if (is.null(spDigit$mapTrans)) transformMap()
    crd <- coordinates(spDigit$mapTrans)
    col <- rgb(spDigit$mapTrans@data / 255)
    plot(crd, cex=0.5, pch=16, asp=1, col=col)

    spac <- as.double(tclvalue(spDigit$spacing))
    abline(v=seq(-180, 180, spac), col='gray')
    abline(h=seq(-90, 90, spac), col='gray')
    abline(v=seq(-180, 180, spac*10), col='red')
    abline(h=seq(-90, 90, spac*10), col='red')

    points(spDigit$mapSpPoints, cex=0.5, pch=16, col='green')

}
