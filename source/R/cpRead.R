cpRead <-
function(cpfile)
### Reads the contents of a control points file
{
    cp <- read.table(cpfile, sep = ";", header = TRUE)
    if (ncol(cp) < 2) {
        tkmessageBox(message = paste("The control points file must have at",
                                     "least 2 columns with X and Y.\nCheck the",
                                     "if the separator is \";\" and if the",
                                     "file has a header"))
    } else if (nrow(cp) < 4) {
        tkmessageBox(message = paste("The control points file must have at",
                                     "least 4 reference points."))
    } else {
        assign("refPoints", cp, envir = spDigit)
    }
}
