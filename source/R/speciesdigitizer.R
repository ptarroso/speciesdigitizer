speciesdigitizer <- function() {
    initspDigit()
    
    ## GUI
    tt <- tktoplevel()
    tkwm.geometry(tt, "300x250+1+1")
    tkwm.title(tt, "Species Digitizer")
    tkwm.resizable(tt, FALSE, FALSE)

    ## #### Load file buttons #### ##

    imgFileFrame <- tkframe(tt)
    file.but <- tkbutton(imgFileFrame, text = "Image file",
                         width = 10, command = function() imgDialog())
    file.lbl <- tklabel(imgFileFrame, foreground = "gray40",
                        width = 20, textvariable = spDigit$mapFile)
    tkgrid(file.but, file.lbl)
    tkgrid(imgFileFrame)

    cpFileFrame <- tkframe(tt)
    cpFile.but <- tkbutton(cpFileFrame, text = "Control points",
                           width = 10, command = function() cpDialog())
    cpFile.lbl <- tklabel(cpFileFrame, foreground = "gray40",
                          width = 20, textvariable = spDigit$cpFile)
    tkgrid(cpFile.but, cpFile.lbl)
    tkgrid(cpFileFrame)


    ## #### Display/Control points #### ##

    cPointsFrame <- tkframe(tt, borderwidth = 2, relief = "ridge", 
                            pady=1)
    show.but <- tkbutton(cPointsFrame, text = "Show image", 
                         width = 15, command = function() displayMap())
    cp.but <- tkbutton(cPointsFrame, text = "Set Control Points",
                       width = 15, command = function() controlPoints())
    tkgrid(show.but, cp.but)
    tkgrid(cPointsFrame, pady=10)

    ## #### Color picker #### ##

    colFrame <- tkframe(tt, borderwidth = 2, relief = "ridge")
    thres.lbl <- tklabel(colFrame, text = "Color threshold")
    thres.entry <- tkentry(colFrame, width = 3,
                           textvariable = spDigit$thres)
    spac.lbl <- tklabel(colFrame, text = " Grid spacing")
    spac.entry <- tkentry(colFrame, width = 3,
                          textvariable = spDigit$spacing)
    col.but <- tkbutton(colFrame, text = "Point color",
                        command = function() getColor())
    tkgrid(thres.lbl, thres.entry, spac.lbl, spac.entry)
    tkgrid(col.but, columnspan = 4)
    tkgrid(colFrame)

    ## #### Final Check #### ## 

    spFrame <- tkframe(tt)
    check.but <- tkbutton(spFrame, text = "Final check",
                          command = function() check())
    add.but <- tkbutton(spFrame, text = "+",
                        command = function()  add.points())
    rm.but <- tkbutton(spFrame, text = "-",
                       command = function() rm.points())
    tkgrid(check.but, add.but, rm.but)
    tkgrid(spFrame, pady = 10)

    ## #### Write file #### ## 
    
    write.but <- tkbutton(tt, text = "Write file",
                          command = function() writedata())
    tkgrid(write.but)
    
    tkfocus(tt)
}
    

    
