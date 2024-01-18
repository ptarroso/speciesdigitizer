writedata <-
function()
### Writes species data to file
{
    fileName <- tclvalue(tkgetSaveFile(filetypes = "{text {.txt}}"))
    if (!nchar(fileName)) {
        tkmessageBox(message = "No file was selected!")
    } else {
        write.table(spDigit$mapSpPoints, fileName, row.names=FALSE,
                    col.names = TRUE, sep = ';', quote = FALSE)

        ## Save georeferenced map
        if (tclvalue(spDigit$savemap) == "1") {
            ## Copy map image with world file.
            baseName <- strsplit(fileName, "\\.")[[1]]
            baseName <- paste(baseName[-length(baseName)], collapse = ".")
            writeRaster(spDigit$mapTrans, paste0(baseName, ".tif"))
        }
    }
}
