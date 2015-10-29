local scene = composer.newScene()


local function go()
    rect:removeSelf( )
    numPagesText:removeSelf( )
    composer.gotoScene( "scripts.game" )
end

local function showAd()
    if AdBuddiz.RewardedVideo_isReadyToShow() then
        AdBuddiz.RewardedVideo_show()
    else
         AdBuddiz.showAd()
    end
 end

function scene:create( event )

    group = self.view

    bk = display.newImage("images/bk.png",cx, bottomMarg-718)
    personaje = display.newSprite(mySheet1, sequenceData)
    personaje:setSequence("parado")
    personaje.x = leftMarg+460
    personaje.y = bottomMarg-899
    rect = display.newImageRect(group,"images/rect.png", display.contentWidth, 604 )
    rect.x, rect.y = cx, bottomMarg-300
    numPagesText = display.newText(group, "DUDU", cx, bottomMarg-560, fontText, 40 )
    numPagesText:setFillColor( 0,0,0 )

    playBtn = widget.newButton
    {   
        defaultFile = "images/arrow1.png",
        overFile = "images/arrow2.png",
        onRelease = go
    }

    playBtn.x, playBtn.y = cx, cy + 300

    adBtn = widget.newButton
    {   
        defaultFile = "images/arrow1.png",
        overFile = "images/arrow2.png",
       onRelease = showAd
    }

    adBtn.x, adBtn.y = cx, cy + 500

    group:insert(playBtn)
    group:insert(adBtn)


end-- "scene:create()"



function scene:show( event )

    group = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).




    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.



    end-- "scene:show()"
end-- "scene:show()"



function scene:hide( event )

    group = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

    end-- "scene:hide()"
end-- "scene:hide()"



function scene:destroy( event )

    group = self.view

    -- Called prior to the removal of scene's view ("group").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.


end-- "scene:destroy()"


-- -------------------------------------------------------------------------------


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene