local scene = composer.newScene()

-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- local forward references should go here




function scene:create( event )

    local group = self.view

  
end-- "scene:create()"



function scene:show( event )

    local group = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).




    elseif ( phase == "did" ) then
         --ads:setCurrentProvider( "vungle" )

         blockedGroup.isVisible=true

        if blockedDone == false then --para crearlo solo una vez. Luego lo vamos apareciendo y desapareciendo con los is.Visible
            
            rectBlock = display.newImageRect( blockedGroup,"images/rectBlocked.png", display.contentWidth, 604 )
            rectBlock.x, rectBlock.y = cx, bottomMarg-300
            local options = {
                text = "Comparte la app para desbloquear 16 sonidos más",
                parent = blockedGroup,
                x = cx, 
                y = bottomMarg-400, 
                font = fontText,
                fontSize = 54,
                width= display.contentWidth-100,
                align="center"
            }

            textBlocked = display.newText(options)
        
            rectBlock:addEventListener("touch", rectBlockTouch)
            textBlocked = display.newText(options)

            local shareBtn = widget.newButton
            {
                id="share",
                defaultFile = "images/share1.png",
                overFile = "images/share2.png",
                onRelease = onShareButtonReleased
            }

            -- Center the button
            shareBtn.x = cx
            shareBtn.y = bottomMarg - 150

            blockedGroup:insert(shareBtn)

            blockedDone = true
        end

    end-- "scene:show()"
end-- "scene:show()"



function scene:hide( event )

    local group = self.view
    local phase = event.phase

    if ( phase == "will" ) then
               

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

    end-- "scene:hide()"
end-- "scene:hide()"



function scene:destroy( event )

    local group = self.view

    if pageNum ~= 4 or pageNum~=5 then
        blockedGroup.isVisible=false
    end



end-- "scene:destroy()"


-- -------------------------------------------------------------------------------


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene