display.setStatusBar( display.HiddenStatusBar )

composer = require "composer"
json = require "json" 
widget = require "widget" 
analytics = require "analytics" 
ads = require "ads"
AdBuddiz = require "plugin.adbuddiz"

blockedGroup = display.newGroup( )
backgroundGroup = display.newGroup( )

cx, cy = display.contentCenterX, display.contentCenterY
_W, _H  = display.contentWidth, display.contentHeight
leftMarg, rightMarg = display.screenOriginX, display.contentWidth - display.screenOriginX
topMarg, bottomMarg = display.screenOriginY, display.contentHeight - display.screenOriginY

AdBuddiz.setAndroidPublisherKey("6c2b77ac-be31-488c-963c-93adf0c25988")
AdBuddiz.cacheAds()
AdBuddiz.RewardedVideo_fetch()

analytics.init( "6B985RT2R9NWPX88B76W" )

ads.init( "admob", "ca-app-pub-1709584335667681/2756526250" )

numBtn = 0

share = false

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



--[[
function vungleListener(event)
    print(event.type)

    currScene = composer.getSceneName( "current" )

    if event.type=="adView" and currScene=="scripts.sonidos3" then
        rectBlock:removeSelf( )
        local t = loadTable( "data.json" )
        t.lock1 = false
        saveTable(t, "data.json")
    end

    if event.type=="adView" and currScene=="scripts.sonidos6" then
        rectBlock:removeSelf( )
        local t = loadTable( "data.json" )
        t.lock2 = false
        saveTable(t, "data.json")
    end
end

local t = loadTable( "data.json" )

if t.lock1==true or t.lock2==true then
    --ads.init( "vungle", "com.seja.liedetector", vungleListener )
    --ads:setCurrentProvider( "vungle" )
end

]]

function onSystemEvent( event )
    print( "System event name and type: " .. event.name, event.type )
    if (event.type=="applicationResume" and share) then
        print ("entrandooo")
        local t = loadTable( "data.json" )
        if t.lock1 then
            t.lock1 = false
            composer.hideOverlay( "scripts.blocked1" )
            saveTable(t, "data.json")
        end
    end
end

Runtime:addEventListener( "system", onSystemEvent )

composer.gotoScene("menu")