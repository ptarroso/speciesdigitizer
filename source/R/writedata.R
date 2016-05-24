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

        ## Copy map image with world file.
        baseName <- strsplit(fileName, "\\.")[[1]]
        baseName <- paste(baseName[-length(baseName)], collapse = ".")
        rst.ext <- file_ext(spDigit$pathImage)
        wrl.ext <- paste(substr(rst.ext, 1, nchar(rst.ext)-1), "w", sep = "")

        size <- spDigit$image@grid@cells.dim
        param <- spDigit$at@parameters

        world <- data.frame(lines = c(param[1], param[4], param[2], -param[5],
                                      param[3], size[2] * param[5] + param[6]))

        file.copy(spDigit$pathImage, paste(baseName, rst.ext, sep = "."))
        write.table(world, paste(baseName, wrl.ext, sep = "."),
                    row.names = FALSE, col.names = FALSE)
    }
}
