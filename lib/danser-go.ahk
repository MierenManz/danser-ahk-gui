; the danser-go exe needs to be called "danser.exe" otherwise it will not work
class DANSER { ;                          Only a few parameters are required. use a combination of 2 or more of the following parameters! title, creator or artist.
    __New() { ;                           Creates a new instance of this class and sets default values.
    }
    setdanserpath(path) { ;               Sets the path to the osu danser. You need to specify the path to the exe like this (C:\desktop\osudanser\danser.exe).
        if (InStr(path, ":")) { ;         If you specify a full path to the exe then it will use that, if not it is assumed the path starts from A_ScriptDir.
            this.danserpath := path . " "
        } else {
            this.danserpath := A_ScriptDir . path . " "
        }
        this.danserdir := StrReplace(this.danserpath, "\danser.exe", "") 
    }
    artist(artist) { ;                   Set the artist to search for
        this.artist := "-a=""" . artist . """ "
    }
    title(title) { ;                     Set the title to search for
        this.title := "-t=""" title . """ "
    }
    diff(diff) { ;                       Set the difficulty to search for (This one is required to be called.)
        this.diff := "-d=""" . diff . """ "
    }
    creator(creator) { ;                 Set the creator to search for
        this.creator := "-c=""" . creator . """ "
    }
    cursors(amount) { ;                  Set the amount of mirrored maps
        if (amount != "0") { ; Cannot be 0 because you can't devide by 0
            this.cursors := "-cursors=" . amount . " "
        } else {
            throw "0 cursors were selected. Needs to be atleast 1"
        }
    }
    tag(tagamount) { ;                   Set the amount of cursors playing 1 map
        if (tagamount >= 1) { ; Cannot be 0 because you can't devide by 0
            this.tag := "-tag=" . tagamount . " "
        } else {
            throw "0 tag cursors were selected. needs to be atleast 1"
        }
    }
    speed(speedvalue) { ;               Set the speed of the map
        if (speedvalue != "0" || speedvalue != "0.0" || !speedvalue) ; Cannot be 0 because you can't devide by 0
            this.speed := "-speed=" . speedvalue . " "
    }
    pitch(pitchvalue) { ;               Set the pitch of the song
        if (pitchvalue != "0" || pitchvalue != "0.0" || !pitchvalue) ; Cannot be 0 because you can't devide by 0
            this.pitchvalue := "-pitch=" . pitchvalue . " "
    }
    movement(mover) { ;                 Set the cursor movement algorithm
        if mover in flower,linear,bezier,circular,aggressive ; the movement can only be one of these!
        {
            this.mover := "-mover=" . mover . " "
        }
    }
    fps() { ;                           Enable fps counter(only needs to be called)
        this.fps := "-fps "
    }
    debug() { ;                         Enable debug info(only needs to be called)
        this.debug := "-debug"
    }
    run() { ;                           Starts the osu!dancer made by wieku(github.com)
        if !(this.danserpath || this.danserpath = "") {
            throw "No danser path specified!"
        } else {
            if (this.diff == "") {
                throw "No Difficulty specified!"
            } else {
                SetWorkingDir % this.danserdir
                command := this.danserpath . this.artist . this.title . this.diff . this.creator . this.cursors . this.tag . this.speed . this.pitchvalue . this.mover . this.fps . this.debug
                Clipboard := command
                run % command
            }
        }
    }
}