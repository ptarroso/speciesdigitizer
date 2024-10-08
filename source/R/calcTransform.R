calcTransform <-
function()
### Calculates affine transform based on control and reference points
### It provides at transform (IMAGE -> COORDINATES) as well as
### the reverse rev.at (COORDINATES -> IMAGE).
{
    mapPoints <- spDigit$mapPoints
    refPoints <- spDigit$refPoints
    
    #Calculate transformation
    cpoints <- as.data.frame(cbind(mapPoints, refPoints))
    at <- vec2dtransf::AffineTransformation(cpoints)
    vec2dtransf::calculateParameters(at)
    assign("at", at, envir = spDigit)

    rev.cpoints <- as.data.frame(cbind(refPoints, mapPoints))
    rev.at <- vec2dtransf::AffineTransformation(rev.cpoints)
    vec2dtransf::calculateParameters(rev.at)
    assign("rev.at", rev.at, envir = spDigit)
}
