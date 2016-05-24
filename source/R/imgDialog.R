imgDialog <-
function()
### Opens a file dialog for map image selection by the user
### It read the map as raster to the environment an tries to set the
### default control points file if found in the same folder.
{
    fileName <- tclvalue(tkgetOpenFile())
    if (!nchar(fileName)) {
        tkmessageBox(message = "No file was selected!")
    } else {
        tclvalue(spDigit$mapFile) <- basename(fileName)

        assign("workdir", dirname(fileName), envir = spDigit)
        cpDefault()

        assign("pathImage", fileName, envir = spDigit)

        assign("image", readGDAL(fileName, silent = TRUE),
               envir = spDigit)
        assign("mapTrans", NULL, envir = spDigit)

    }
}
