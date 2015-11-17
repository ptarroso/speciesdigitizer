cpDialog <-
function()
### File dialog to open and read a Control Points table file
{
    fileName <- tclvalue(tkgetOpenFile())
    if (!nchar(fileName)) {
        tkmessageBox(message = "No file was selected!")
    } else {
        tclvalue(spDigit$cpFile) <- basename(fileName)
        
        cpRead(fileName)
        
    }
}
