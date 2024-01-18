getColor <-
function()
### Interactive input of a species distinct color to detect points.
{

    img <- spDigit$image
    displayMap() # elimate points from repeated attempts
    refcol <- locator(1)
    refcol <- as.data.frame(refcol)

    rcol <- unlist(terra::extract(img, refcol, ID=FALSE))

    th <- as.integer(tclvalue(spDigit$thres))

    b1 <- img[][,1] >= rcol[1]-th & img[][,1] <= rcol[1]+th 
    b2 <- img[][,2] >= rcol[2]-th & img[][,2] <= rcol[2]+th
    b3 <- img[][,3] >= rcol[3]-th & img[][,3] <= rcol[3]+th

    imgSpPoints <- as.data.frame(terra::crds(img)[b1 & b2 & b3,])
    assign("imgSpPoints", imgSpPoints, envir = spDigit)
    points(imgSpPoints, cex=0.6, pch=16)
    getSpPoints()
}
