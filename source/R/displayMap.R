displayMap <-
function() {
### Displays a map in the screen with RGB colors
    if (!is.null(spDigit$image)) {
        if (is.null(dev.list())) dev.new(xpos=302)
        par(mar=rep(0,4))
        terra::plotRGB(spDigit$image)
        if (!is.null(spDigit$mapPoints))
            points(spDigit$mapPoints, col='red', pch=4, cex=3)
    }
}
