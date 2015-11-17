displayMap <-
function() {
### Displays a map in the screen with RGB colors
    if (!is.null(spDigit$image)) {
        if (is.null(dev.list())) dev.new(xpos=302)
        par(mar=rep(0,4))
        image(spDigit$image, red=1, green=2, blue=3)
        if (!is.null(spDigit$mapPoints))
            points(spDigit$mapPoints, col='red', pch=4, cex=3)
    }
}
