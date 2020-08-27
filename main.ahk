#NoEnv
SetBatchLines, -1
#include <danser-go>
FileSelectFile, path
osudance := New DANSER()
gui, main:New
Gui, main:Add, Text, +center x90 y5, Title
Gui, main:Add, Edit, +center x2 y2 w80 h20 vTitle
Gui, main:Add, Text, +center x90 y26, Difficulty
Gui, main:Add, Edit, +center x2 y23 w80 h20 vDiff
Gui, main:Add, Text, +center x90 y47, Cursors
Gui, main:Add, Edit, +center Number x2 y44 w80 h20 vCursor
Gui, main:Add, Text, +center x90 y68, Tag Cursors
Gui, main:Add, Edit, +center Number x2 y65 w80 h20 vTag
Gui, main:Add, DropDownList, x2 y86 vMover, flower|linear|bezier|circular|aggressive
Gui, main:Add, Button, x175 y5 w80 h30 gSubmit, Start Danser-GO
gui, main:Show,, danser-go
Return

Submit:
{
    gui, main:Submit, Hide
    osudance.title(title)
    if (!Cursor || Floor(Cursor) = 0) {
        Cursor := 1
    }
    if (!Tag || Floor(Tag) = 0) {
        Tag := 1
    }
    if (Mover = "" || !Mover) {
        Mover := "flower"
    }
    if (!Diff || Diff = "" || Diff = "Difficulty") {
        msgbox, No diff was selected!
        run, %A_ScriptDir%\main.ahk
        exitapp
    }
    osudance.setdanserpath(path)
    osudance.diff(Diff)
    osudance.cursors(Cursor)
    osudance.tag(Tag)
    osudance.movement(Mover)
    osudance.run()
    exitapp
}

mainGuiClose:
{
    exitapp
}