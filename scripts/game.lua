local scene = composer.newScene()

pageNum = 1

    spriteOptions = {   
        height = 820, 
        width = 768,
        sheetContentWidth=1536,
        sheetContentHeight=1640,
        numFrames = 4, 
    }
    mySheet1 = graphics.newImageSheet("images/burlao1.png", spriteOptions) 
    mySheet2 = graphics.newImageSheet("images/burlao2.png", spriteOptions) 
    mySheet3 = graphics.newImageSheet("images/burlao3.png", spriteOptions) 

    sequenceData = {
        {name = "parado", start = 1, sheet = mySheet1, count = 1, time = 500},
        {name = "bailoteo1", start = 2, sheet = mySheet1, count = 3, time = 300, loopCount = 1}, 
        {name = "bailoteo2", start = 1, sheet = mySheet2, count = 4, time = 400, loopCount = 1},
        {name = "bailoteo3", start = 1, sheet = mySheet3, count = 2, time = 200, loopCount = 1},

        {name = "bailoteo1R", frames = {4,3,2}, sheet = mySheet1, time = 300, loopCount = 1}, 
        {name = "bailoteo2R", frames = {4,3,2,1}, sheet = mySheet2, count = 4, time = 400, loopCount = 1},
        {name = "bailoteo3R", frames = {2,1}, sheet = mySheet3, time = 200, loopCount = 1},
    }   

function swapSheet5()
        personaje:setSequence( "bailoteo1R" )
        personaje:play()
        tmrSheet5=timer.performWithDelay( 300, swapSheet )
end

function swapSheet4()
        personaje:setSequence( "bailoteo2R" )
        personaje:play()
        tmrSheet4=timer.performWithDelay( 400, swapSheet5 )
end

function swapSheet3()
        personaje:setSequence( "bailoteo3R" )
        personaje:play()
        tmrSheet3=timer.performWithDelay( 200, swapSheet4 )
end

function swapSheet2()
        personaje:setSequence( "bailoteo3" )
        personaje:play()
        tmrSheet2=timer.performWithDelay( 200, swapSheet3 )
end

    function swapSheet()
        personaje:setSequence( "bailoteo2" )
        personaje:play()
        tmrSheet=timer.performWithDelay( 400, swapSheet2 )
end



function scene:create( event )

    local group = self.view

    bk = display.newImage("images/bk.png",cx, bottomMarg-718)
    personaje = display.newSprite(mySheet1, sequenceData)
    personaje:setSequence("parado")
    personaje.x = leftMarg+460
    personaje.y = bottomMarg-899
	
	
   
    
    composer.gotoScene( "scripts.sonidos1" )

    local function handleArrow1Event( event )

        if ( "ended" == event.phase ) then
            cleanScene(i)
            pageNum = pageNum + 1

            if pageNum == 2 then
                cleanScene(1)
                arrow2.isVisible = true
                composer.gotoScene( "scripts.sonidos2", {effect="slideLeft", time=700} )
                elseif pageNum == 3 then
                    cleanScene(9)
                    composer.gotoScene( "scripts.sonidos3", {effect="slideLeft", time=700} )
                    elseif pageNum == 4 then
                        cleanScene(17)
                        composer.gotoScene( "scripts.sonidos4", {effect="slideLeft", time=700} )
                        elseif pageNum == 5 then
                            cleanScene(25)
                            composer.gotoScene( "scripts.sonidos5", {effect="slideLeft", time=700} )
                            elseif pageNum == 6 then
                                cleanScene(33)
                                composer.gotoScene( "scripts.sonidos6", {effect="slideLeft", time=700} )
                                arrow1.isVisible = false
            end
            numPagesText.text = pageNum.."/"..pageMax
        end
    end

    -- Create the widget
     arrow1 = widget.newButton
    {
        
        defaultFile = "images/arrow1.png",
        overFile = "images/arrow2.png",
        onEvent = handleArrow1Event
    }

    arrow1.x, arrow1.y = rightMarg-80, bottomMarg-567
    arrow1:scale(0.6,0.6)
    

    local function handleArrow2Event( event )

        if ( "ended" == event.phase ) then
            

            if pageNum == 2 then
                cleanScene(9)
                composer.gotoScene( "scripts.sonidos1", {effect="slideRight", time=700} )
                arrow2.isVisible = false
                elseif pageNum == 3 then
                    cleanScene(17)
                    composer.gotoScene( "scripts.sonidos2", {effect="slideRight", time=700} )
                    elseif pageNum == 4 then
                        cleanScene(25)
                        composer.gotoScene( "scripts.sonidos3", {effect="slideRight", time=700} )
                        elseif pageNum == 5 then
                            cleanScene(33)
                            composer.gotoScene( "scripts.sonidos4", {effect="slideRight", time=700} )
                            elseif pageNum == 6 then
                                cleanScene(41)
                                composer.gotoScene( "scripts.sonidos5", {effect="slideRight", time=700} )
                                arrow1.isVisible = true
            end
            pageNum = pageNum - 1
            numPagesText.text = pageNum.."/"..pageMax
        end
    end

    -- Create the widget
     arrow2 = widget.newButton
    {
        
        defaultFile = "images/arrow1.png",
        overFile = "images/arrow2.png",
        onEvent = handleArrow2Event
    }

    arrow2.x, arrow2.y = leftMarg+80, bottomMarg-567
    arrow2:scale(-0.6,0.6)
   
    arrow2.isVisible = false
    --rect = display.newRect( group, cx, bottomMarg-250, display.contentWidth, 500 )
end-- "scene:create()"



function scene:show( event )

    local group = self.view
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

    local group = self.view
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

    local group = self.view

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