add.points <-
function() {
### Allows to add extra points during the final check
### Left mouse button to remove and right to terminate!
    add.pnt <- as.data.frame(locator())
    spacX <- as.double(tclvalue(spDigit$spacingX))
    spacY <- as.double(tclvalue(spDigit$spacingY))
    add.pnt[,1] <- add.pnt[,1] - add.pnt[,1] %% spacX + spacX/2
    add.pnt[,2] <- add.pnt[,2] - add.pnt[,2] %% spacY + spacY/2
    points <- spDigit$mapSpPoints
    for (j in 1:nrow(add.pnt)) {
        pnt <- add.pnt[j,]
        i <- which(points$x == pnt$x & points$y == pnt$y)
        if (length(i) == 0) points <- rbind(points, pnt)
    }
    assign("mapSpPoints", points, envir = spDigit)
    check()
}
