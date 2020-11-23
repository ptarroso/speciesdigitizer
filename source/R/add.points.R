add.points <-
function() {
### Allows to add extra points during the final check
### Left mouse button to remove and right to terminate!
    add.pnt <- as.data.frame(locator())
    add.pnt <- grdCenter(add.pnt)
    points <- spDigit$mapSpPoints
    for (j in 1:nrow(add.pnt)) {
        pnt <- add.pnt[j,]
        i <- which(points$x == pnt$x & points$y == pnt$y)
        if (length(i) == 0) points <- rbind(points, pnt)
    }
    assign("mapSpPoints", points, envir = spDigit)
    check()
}
