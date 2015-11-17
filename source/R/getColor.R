getColor <-
function()
### Interactive input of a species distinct color to detect points.
{

    img <- spDigit$image
    displayMap() # elimate points from repeated attempts
    refcol <- locator(1)
    refcol <- as.data.frame(refcol)
    coordinates(refcol) <- ~x+y

    rcol <- over(refcol, img) 
   
    th <- as.integer(tclvalue(spDigit$thres))
   
    b1 <- img$band1 >= rcol[[1]]-th & img$band1 <= rcol[[1]]+th 
    b2 <- img$band2 >= rcol[[2]]-th & img$band2 <= rcol[[2]]+th
    b3 <- img$band3 >= rcol[[3]]-th & img$band3 <= rcol[[3]]+th

    imgSpPoints <- as.data.frame(coordinates(img)[b1 & b2 & b3,])
    assign("imgSpPoints", imgSpPoints, envir = spDigit)
    points(imgSpPoints, cex=0.6, pch=16)
    getSpPoints()
}
