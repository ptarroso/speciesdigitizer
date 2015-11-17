cpDefault <-
function()
### Sets the default control points file if present in "path"
{
    cpfile <- file.path(spDigit$workdir, "ControlPoints.txt")
    if (file.exists(cpfile)) {
        tclvalue(spDigit$cpFile) <- basename(cpfile)
        cpRead(cpfile)
    }
}
