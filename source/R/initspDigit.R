## Environment for variable storage
spDigit <- new.env()

initspDigit <- function() {
    assign("image", NULL, envir = spDigit)
    assign("workdir", NULL, envir = spDigit)
    assign("refPoints", NULL, envir = spDigit)
    assign("mapPoints", NULL, envir = spDigit)
    assign("mapSpPoints", NULL, envir = spDigit)
    assign("imgSpPoints", NULL, envir = spDigit)
    assign("at", NULL, envir = spDigit)
    assign("rev.at", NULL, envir = spDigit)
    assign("mapTrans", NULL, envir = spDigit)
    assign("mapFile",  tclVar("No file selected"), envir = spDigit)
    assign("cpFile", tclVar("No file selected"), envir = spDigit)
    assign("thres", tclVar(20), envir = spDigit)
    assign("spacing", tclVar(1), envir = spDigit)
}
