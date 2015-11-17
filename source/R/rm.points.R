rm.points <-
function()
### Allows to remove points during the final check
### Left mouse button to remove and right to terminate!
{
    rm.pnt <- as.data.frame(locator())
    spac <- as.double(tclvalue(spDigit$spacing))
    rm.pnt <- rm.pnt - rm.pnt %% spac + spac/2
    points <- spDigit$mapSpPoints
    for (j in 1:nrow(rm.pnt)) {
        pnt <- rm.pnt[j,]
        i <- which(points$x == pnt$x & points$y == pnt$y)
        if (length(i) > 0) points <- points[-i,]
    }
    assign("mapSpPoints", points, envir = spDigit)
    check()    
}
