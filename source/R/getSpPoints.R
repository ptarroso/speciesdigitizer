getSpPoints <-
function()
# Detects unique points based on the real coordiantes and plots
{
    imgSpPoints <- spDigit$imgSpPoints

    # Note: converting between sf <-> sp because of vec2dtransf dependecies
    #       Need to change whenever the vec2dtrans library updates to sf.
    imgSpPoints <- sf::st_as_sf(imgSpPoints, coords = c("x","y"))
    mapTransPoints <- vec2dtransf::applyTransformation(spDigit$at,
                                                    as(imgSpPoints, "Spatial"))
    mapTransPoints <- sf::st_coordinates(sf::st_as_sf(mapTransPoints))

    mapSpPoints <- grdCenter(mapTransPoints)
    colnames(mapSpPoints) <- c("x", "y")

    assign("mapSpPoints",  mapSpPoints, envir = spDigit)

    # Note: converting between sf <-> sp because of vec2dtransf dependecies
    #       Need to change whenever the vec2dtrans library updates to sf.
    mapSpPoints <- sf::st_as_sf(mapSpPoints, coords = c("x","y"))
    imgSpPoints <- vec2dtransf::applyTransformation(spDigit$rev.at,
                                                    as(mapSpPoints, "Spatial"))
    imgSpPoints <- sf::st_coordinates(sf::st_as_sf(imgSpPoints))
    assign("imgSpPoints", imgSpPoints, envir = spDigit)

    points(imgSpPoints, cex=0.6, pch=16, col='red')
}
