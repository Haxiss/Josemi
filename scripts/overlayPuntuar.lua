local scene = composer.newScene()





function scene:create( event )

    group = self.view

    rectExit=display.newCircle( group,rightMarg-58, bottomMarg-1230, 55 )    
    overlayPuntuar = display.newImage( group,"images/overlayPuntuar.png",cx,cy)

    
    local function rectExitTouch(event)
        
        if event.phase == "ended" then
        
        overlayPuntuar:removeSelf( )
        rectExit:removeSelf( )
        composer.hideOverlay( "scripts.overlayPuntuar" )

        end
    end
rectExit:addEventListener("touch",rectExitTouch)

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