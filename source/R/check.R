check <-
function()
### Displays the image with a reference grid for a final check.
{
    if (is.null(spDigit$mapTrans)) transformMap()

    # check if desired resolution is lower than available
    spcX <- as.numeric(tclvalue(spDigit$spacingX))
    spcY <- as.numeric(tclvalue(spDigit$spacingY))
    bb <- as.vector(terra::ext(spDigit$mapTrans))
    res <- terra::res(spDigit$mapTrans)

    if (spcX < res[1] | spcY < res[2]) {
      msg <- paste0("The desired resolution (", spcX, ", ", spcY, ") is ",
                    "lower than the available resolution in the image (",
                    res[1], ", ", res[2], "). Choose a lower grid spacing or ",
                    "use an image with more resolution.")
      answer <- tk_messageBox(type = "ok", message=msg)
    } else {
      terra::plotRGB(spDigit$mapTrans)
      bb <- bb - bb%%1
      # Quick&dirty way to find the second grid spacing
      secgrd <- 10
      if (diff(bb[1:2]) > 360 | diff(bb[3:4]) > 180) {
        secgrd <- 1000
      }
      bb2 <- bb - bb%%secgrd
      abline(v=seq(bb[1], bb[2], spcX), col='gray')
      abline(h=seq(bb[3], bb[4], spcY), col='gray')
      abline(v=seq(bb2[1], bb2[2], secgrd), col='red')
      abline(h=seq(bb2[3], bb2[4], secgrd), col='red')
      points(spDigit$mapSpPoints, cex=0.5, pch=16, col='green')
  }
}
