#NoEnv
SetBatchLines, -1
#include <danser-go>
FileSelectFile, path
osudance := New DANSER()
gui, main:New
Gui, main:Add, Text, +center x130 y5, Title
Gui, main:Add, Edit, +center x2 y2 w120 h20 vTitle, Title
Gui, main:Add, Text, +center x90 y26, Difficulty
Gui, main:Add, Edit, +center x2 y23 w80 h20 vDiff, Difficulty
Gui, main:Add, Text, +center x90 y47, Cursors
Gui, main:Add, Edit, +center Number x2 y44 w80 h20 vCursor, Cursors
Gui, main:Add, Text, +center x90 y68, Tag Cursors
Gui, main:Add, Edit, +center Number x2 y65 w80 h20 vTag, Tag Cursors
Gui, main:Add, DropDownList, x2 y86 vMover, flower|linear|bezier|circular|aggressive
Gui, main:Add, Button, x175 y5 w80 h30 gSubmit, Start Danser-GO
gui, main:Show,, danser-go
Return

Submit:
{
    gui, main:Submit, Hide
    if (Title != "" || Title != "Title") {
        osudance.title(title)
    }
    if (Cursors = "" || Cursors = 0 || Cursors = "Cursors") {
        Cursors := 1
    }
    if (Tag = "" || Tag = 0 || Tag = "Tag Cursors") {
        Tag := 1
    }
    if (Mover = "" || !Mover) {
        Mover := "flower"
    }
    if (Diff = "" || Diff = "Difficulty") {
        msgbox, No diff was selected!
        run, %A_ScriptDir%\main.ahk
        exitapp
    }
    osudance.setdanserpath(path)
    osudance.diff(Diff)
    osudance.cursors(Cursors)
    osudance.tag(Tag)
    osudance.movement(Mover)
    osudance.run()
}