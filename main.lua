display.setStatusBar( display.HiddenStatusBar )

composer = require "composer"
json = require "json" 
widget = require "widget" 
analytics = require "analytics" 
ads = require "ads"
AdBuddiz = require "plugin.adbuddiz"

share = false

blockedGroup = display.newGroup( )
backgroundGroup = display.newGroup( )

cx, cy = display.contentCenterX, display.contentCenterY
_W, _H  = display.contentWidth, display.contentHeight
leftMarg, rightMarg = display.screenOriginX, display.contentWidth - display.screenOriginX
topMarg, bottomMarg = display.screenOriginY, display.contentHeight - display.screenOriginY

AdBuddiz.setAndroidPublisherKey("e5d4253d-d5de-4a0e-87d4-85517edc7dfe")
AdBuddiz.cacheAds()
AdBuddiz.RewardedVideo_fetch()

analytics.init( "6B985RT2R9NWPX88B76W" )

ads.init( "admob", "ca-app-pub-1709584335667681/1378802655" )

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

    if not t.numBtn then
        t.numBtn = 0
        saveTable(t, "data.json")
    end



tables = require "tables"

t = os.date( '*t' )
t0 = os.time( t )

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
    print(event.type)
    if (event.type=="applicationSuspend") then
        t = os.date( '*t' )
        t0 = os.time( t )
        print(t0)
    end

    if (event.type=="applicationResume" and share) then
        t = os.date( '*t' )
        local dif = os.time( t ) - t0
        print(dif)
        if dif >= 10 then
            print("compartido")
            analytics.logEvent("Compartido")
            local t = loadTable( "data.json" )
            if t.lock1 then
                t.lock1 = false
                composer.hideOverlay( "scripts.blocked1" )
                saveTable(t, "data.json")
            end
        end
        share = false
    end
end

Runtime:addEventListener( "system", onSystemEvent )

composer.gotoScene("menu")