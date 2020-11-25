check <-
function()
### Displays the image with a reference grid for a final check.
{
    if (is.null(spDigit$mapTrans)) transformMap()

    # check if desired resolution is lower than available
    spcX <- as.numeric(tclvalue(spDigit$spacingX))
    spcY <- as.numeric(tclvalue(spDigit$spacingY))
    bb <- bbox(spDigit$mapTrans)
    res <- spDigit$mapTrans@grid@cellsize

    if (spcX < res[1] | spcY < res[2]) {
      msg <- paste0("The desired resolution (", spcX, ", ", spcY, ") is ",
                    "lower than the available resolution in the image (",
                    res[1], ", ", res[2], "). Choose a lower grid spacing or ",
                    "use an image with more resolution.")
      answer <- tk_messageBox(type = "ok", message=msg)
    } else {
      # Tweak colors for rgb displayMap
      col <- as.factor(rgb(spDigit$mapTrans@data / 255))
      rgb <- data.frame(band1=as.numeric(col))
      coordinates(rgb) <- coordinates(spDigit$mapTrans)
      gridded(rgb) <- TRUE
      image(rgb, col=levels(col))
      bb <- bb - bb%%1
      # Quick&dirty way to find the second grid spacing
      secgrd <- 10
      if (diff(bb[1,]) > 360 | diff(bb[2,]) > 180) {
        secgrd <- 1000
      }
      bb2 <- bb - bb%%secgrd
      abline(v=seq(bb[1,1], bb[1,2], spcX), col='gray')
      abline(h=seq(bb[2,1], bb[2,2], spcY), col='gray')
      abline(v=seq(bb2[1,1], bb2[1,2], secgrd), col='red')
      abline(h=seq(bb2[2,1], bb2[2,2], secgrd), col='red')
      points(spDigit$mapSpPoints, cex=0.5, pch=16, col='green')
  }
}
