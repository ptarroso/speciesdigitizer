grdCenter <-
function(x, unique=TRUE)
### centers a table of coordinates in relation to the grid X and Y spacing
### 'x' is a two column table with x and y coords (order matters)
### if 'unique' is true, returns only unique coordinates
{
  spacX <- as.numeric(tclvalue(spDigit$spacingX))
  spacY <- as.numeric(tclvalue(spDigit$spacingY))

  x[,1] <- x[,1] - x[,1] %% spacX + spacX/2
  x[,2] <- x[,2] - x[,2] %% spacY + spacY/2

  if (unique) {
    x <- unique(x)
  }

  return(as.data.frame(x))
}
