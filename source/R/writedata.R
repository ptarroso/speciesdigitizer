writedata <-
function()
### Writes species data to file
{
    fileName <- tclvalue(tkgetSaveFile())
    if (!nchar(fileName)) {
        tkmessageBox(message = "No file was selected!")
    } else {
        write.table(spDigit$mapSpPoints, fileName, row.names=FALSE,
                    col.names = TRUE, sep = ';', quote = FALSE)
        rasterName <- strsplit(fileName, "\\.")[[1]]
        rasterName <- paste(c(rasterName[-length(rasterName)], "tif"),
                            collapse = ".")
        writeGDAL(spDigit$mapTrans, rasterName, mvFlag=-9999)
    }
}
