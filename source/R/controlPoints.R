controlPoints <-
function()
### Ask the input of n reference points in the map by the user
### where n is the number of control points found in the file.
{
    n <- nrow(spDigit$refPoints)
    displayMap()
    assign("mapPoints", as.data.frame(locator(n)),
           envir = spDigit)
    calcTransform()
    displayMap()
}
