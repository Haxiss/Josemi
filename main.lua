native.setProperty( "androidSystemUiVisibility", "immersiveSticky" )
display.setStatusBar( display.HiddenStatusBar )

composer = require "composer"
json = require "json" 
widget = require "widget" 


ads = require "ads"

cx, cy = display.contentCenterX, display.contentCenterY
_W, _H  = display.contentWidth, display.contentHeight
leftMarg, rightMarg = display.screenOriginX, display.contentWidth - display.screenOriginX
topMarg, bottomMarg = display.screenOriginY, display.contentHeight - display.screenOriginY

ads.init( "admob", "yourAppID", admobListener )

numBtn = 0

function saveTable(t, filename)
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local file = io.open(path, "w")
    if file then
        local contents = json.encode(t)
        file:write( contents )
        io.close( file )
        return true
    else
        return false
    end
end

function loadTable(filename)
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local contents = ""
    local myTable = {}
    local file = io.open( path, "r" )
    if file then
         local contents = file:read( "*a" )
         myTable = json.decode( contents )
         io.close( file )
         return myTable 
    end
    return nil
end

local t = loadTable( "data.json" )
	
	if t == nil then 
	    local data = {}
	    data.lock1 = true
        data.lock2 = true
	    saveTable(data, "data.json")
	end

tables = require "tables"

function vungleListener()

    currScene = composer.getSceneName( "current" )

    if (event.type == "cachedAdAvailable" and (currScene~="sonidos1" or currScene~="sonidos2")) then

        vungleBtn = widget.newButton{
            textOnly = true,
            label = "VIDEO",
            onRelease = 
                function () 
                    ads.show("interstitial")
                end
            } 
        vungleBtn.x, vungleBtn.y = cx, bottomMarg-300
        group:insert(vungleBtn)

    end
end

if t.lock1==false and t.lock2==false then
    ads.init( "vungle", "com.seja.liedetector", vungleListener )
end

function onSystemEvent( event )
    if (event.type=="applicationSuspend") then
        native.setProperty( "androidSystemUiVisibility", "immersiveSticky" )
    end
end

Runtime:addEventListener( "system", onSystemEvent )

composer.gotoScene("scripts.game")