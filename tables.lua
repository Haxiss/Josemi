soundTable =  { 
"sounds/20_porros_burlaos.mp3",
"sounds/eresUnPayaso.mp3",
"sounds/cara_xupada.mp3",
"sounds/piva_disfruta.mp3",
"sounds/miedo_morir.mp3",
"sounds/estoyBurlao.mp3",
"sounds/isTheJungleNigga.mp3", 
"sounds/maricas_tronista.mp3",

"sounds/tiroEnLaRodilla.mp3",
"sounds/meLaSuda.mp3",
"sounds/noMeAcelero.mp3",
"sounds/lol.mp3",
"sounds/profesores_avispao.mp3",
"sounds/miraleElNiggie.mp3",
"sounds/padre_capon.mp3",
"sounds/noSoyUnNiño.mp3",

"sounds/pasmao_atontao.mp3",
"sounds/suerte.mp3",
"sounds/quedasConmigo.mp3",
"sounds/laPutaTele.mp3",
"sounds/nada.mp3",
"sounds/tonto_dios.mp3",
"sounds/vida_mierda.mp3",
"sounds/yoSoyFeliz.mp3",

"sounds/soysTanBravos.mp3",
"sounds/aquiHayWalthers.mp3",
"sounds/compadre.mp3",
"sounds/calleAguilon9.mp3",
"sounds/conMisNegros.mp3",
"sounds/cuidao.mp3",
"sounds/chivatoDeMierda.mp3",
"sounds/jodidosMaricones.mp3",

"sounds/dandoVueltas.mp3",
"sounds/envidia_mala.mp3",
"sounds/mierda_no_gusta.mp3",
"sounds/no_esnifo.mp3",
"sounds/noMeSuenas.mp3",
"sounds/pagafantas.mp3",
"sounds/pitbulls.mp3",
"sounds/pivudo.mp3",

"sounds/pajas.mp3",
"sounds/querer.mp3",
"sounds/trapo.mp3",
"sounds/jefe.mp3",
"sounds/guarra.mp3",
"sounds/fuerte.mp3",
"sounds/calentando.mp3",
"sounds/beso.mp3",
}
sound = {}
 for i=1, #soundTable do
    sound[i]=audio.loadSound( soundTable[i] )
end


textTable = {
"20 porros",
"Payaso",
"Cara",
"Disfruta",
"Morir",
"Estoy Burlao",
"Jungle",
"Maricas",

"Tiro",
"Suda",
"Acelero",
"LOL",
"Avispao",
"Niggie",
"Capón",
"Niño",

"Pasmao",
"Suerte",
"Primo",
"Tele",
"Nada",
"Tonto",
"Mi vida",
"Soy feliz",

"Bravos",
"Walthers",
"Compadre",
"Aguilón 9",
"Negros",
"Cuidao",
"Chivato",
"Maricones",

"Vueltas",
"Envidia",
"No gusta",
"No esnifo",
"Suena",
"Pagafantas",
"Pitbulls",
"Picudo",

"Pajas",
"Querer",
"Trapo",
"GTA",
"Guarra",
"Fuerte",
"Calentando",
"Beso",


}

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

--Sprites botones
dataBtn = { width=150, height=149, numFrames=2,}
buttonSheet1 = graphics.newImageSheet( "images/buttonSprite1.png", dataBtn )
buttonSheet2 = graphics.newImageSheet( "images/buttonSprite2.png", dataBtn )
buttonSheet3 = graphics.newImageSheet( "images/buttonSprite3.png", dataBtn ) 
buttonSheet4 = graphics.newImageSheet( "images/buttonSprite4.png", dataBtn ) 
buttonSheet5 = graphics.newImageSheet( "images/buttonSprite5.png", dataBtn ) 
buttonSheet6 = graphics.newImageSheet( "images/buttonSprite6.png", dataBtn ) 

sequenceDataBtn = {
        { name = "default", start=1, count=1, time=125},
        { name = "pressed", start=2, count=1, time=125}, } 

--tablas
button={}
text={}

fontText = "PTS75F"
fontTextSize = 40


function soundListener()
    personaje:setSequence( "parado" )
    personaje:play()
    --audio.resume( intro )
    soundPlaying = false
    cleanTimers()
end

function cleanTimers()
    if tmrSheet then
        timer.cancel(tmrSheet)
    end
    if tmrSheet2 then
        timer.cancel(tmrSheet2)
    end
    if tmrSheet3 then
        timer.cancel(tmrSheet3)
    end
    if tmrSheet4 then
        timer.cancel(tmrSheet4)
    end
    if tmrSheet5 then
        timer.cancel(tmrSheet5)
    end 
    if tmrSwapSprite then
        timer.cancel( tmrSwapSprite )
    end
end

function createPage(numSound, groupName)

    rect = display.newImageRect(group,"images/rect.png", display.contentWidth, 604 )
    rect.x, rect.y = cx, bottomMarg-300
    
    pageMax = 5
    
    numPagesText = display.newText(groupName,  pageNum.."/"..pageMax, cx, bottomMarg-560, fontText, 60 )
    numPagesText:setFillColor( 0,0,0 )

    for i=1, 8 do
        
        if i < 5 then 
            btnX = display.contentWidth/4*i-100
            btnY = bottomMarg-370
        else
            btnX = display.contentWidth/4*(i-4)-100
            btnY = bottomMarg-150
        end

        text[i] = display.newText( groupName, textTable[numSound], btnX, btnY+110, fontText, fontTextSize )
        text[i]:setFillColor( 1,1,1 )

        textMessage = display.newText( groupName, "Mantén pulsado para compartir",cx-50, bottomMarg-485, "OpenSans-Regular", 40 )
        textMessage:setFillColor( 1,1,1 )
        whatsappLogo = display.newImage( groupName, "images/whatsapp.png", rightMarg-95, bottomMarg-485)
        whatsappLogo:scale(0.5,0.5)
        textMessage.isVisible=true
        whatsappLogo.isVisible=true
        
        if numSound>= 1 and numSound<9 then 
            button[i] = display.newSprite( buttonSheet1, sequenceDataBtn )

        elseif numSound>= 9 and numSound<17 then 
            button[i] = display.newSprite( buttonSheet2, sequenceDataBtn )

        elseif numSound>= 17 and numSound<25 then 
            button[i] = display.newSprite( buttonSheet3, sequenceDataBtn )

        elseif numSound>= 25 and numSound<33 then 
            button[i] = display.newSprite( buttonSheet4, sequenceDataBtn )

        elseif numSound>= 33 and numSound<41 then 
            button[i] = display.newSprite( buttonSheet5, sequenceDataBtn )

        elseif numSound>= 41 and numSound<49 then 
            button[i] = display.newSprite( buttonSheet6, sequenceDataBtn )
        end
        
        button[i].x, button[i].y = btnX, btnY

        button[i].id = numSound
        button[i]:scale(0.95,0.95)

        groupName:insert(button[i])

        function buttonTouch(event)
            if ( event.phase == "began" )  then
                button[i]:setSequence("pressed")
                audio.pause(backgroundMusicChannel)
                audio.stop(sonidoChannel)
                tmrBtnDefault=timer.performWithDelay( 1000, function ( )button[i]:setSequence("default") end )
                manteniendo = false
                if tmrShare then
                    timer.cancel( tmrShare )
                end
                sonidoShare = soundTable[button[i].id]
                tmrShare = timer.performWithDelay( 1000, shareSound )
            elseif ( event.phase == "ended") then
                timer.cancel( tmrShare )
                soundPlaying = true
                button[i]:setSequence("default")
                
                cleanTimers()

                if numBtn>15 then
                    --ads:setCurrentProvider( "admob" )
                    ads.show("interstitial", { testMode=false })
                    --ads:setCurrentProvider( "vungle" )
                    numBtn = 0
                else 
                    numBtn = numBtn + 1
                end
                print(numBtn)
                print( textTable[button[i].id] )
                analytics.logEvent(textTable[button[i].id])
                if manteniendo==false then
                personaje:setSequence( "bailoteo1" )
                tmrSwapSprite=timer.performWithDelay( 600, swapSheet )
                personaje:play()
                audio.pause(backgroundMusicChannel)
                sonidoChannel= audio.play(sound[button[i].id], { onComplete=soundListener})
                end
            end
        end
        
    function shareSound()
        system.vibrate()
        if tmrShare then
            timer.cancel( tmrShare )
        end
        manteniendo = true
        print(sonidoShare)
        local isAvailable = native.canShowPopup( "social", "share" )

        -- If it is possible to show the popup
        if isAvailable  then
           -- shareSoundFlag=true
            local listener = {}
            
            -- Show the popup
            native.showPopup( "social",
            {
                service = "share", -- The service key is ignored on Android.
                message = "Burlaos Sonidos ¡La app que lo está petando en el barrio! Yo ya me la he descargado",
                image = 
                {
                    { filename = sonidoShare, baseDir = system.ResourceDirectory },
                },
                url = { "https://play.google.com/store/apps/details?id=com.masah.burlaossonidos", }
            })
        end
    end
button[i]:addEventListener("touch",buttonTouch)
numSound = numSound + 1


end
end

function cleanScene(numSound)
    currScene = composer.getSceneName( "current" )
    composer.hideOverlay( "scripts.blocked1")
    composer.removeScene( currScene )
end

--Página Bloqueado

function rectBlockTouch(event)
    if event.phase =="ended" then
        ads.show("incentivized")
    end

    return true
end

function rectBlockTouch2(event)

    return true
end

blockedDone = false

function blockedPage()

    local t = loadTable( "data.json" )

    currScene = composer.getSceneName( "current" )
    
    if t.lock1 and (currScene=="scripts.sonidos4" or currScene=="scripts.sonidos5")then
        composer.showOverlay( "scripts.blocked1" )
    end


--[[
    if t.lock2 and currScene=="scripts.sonidos6" then

        --ads:setCurrentProvider( "vungle" )

        rectBlock = display.newRect( group, cx, bottomMarg-300, display.contentWidth, 604 )
        rectBlock:setFillColor( 0,0,0,0.6 )
    
        ads:setCurrentProvider( "vungle" )
        rectBlock = display.newImageRect( group, "images/rectBlocked2.png", display.contentWidth, 604 )
        rectBlock.x, rectBlock.y = cx, bottomMarg-300
          local options = {
            text = "Desbloquea sonidos únicos de Josemi",
            parent = group,
            x = cx, 
            y = bottomMarg-295, 
            font = fontText,
            fontSize = 60,
            width= display.contentWidth-100,
            align="center"
            }
            logos = display.newImage( group, "images/logos.png", cx+60,bottomMarg-260 )
         textBlocked = display.newText(options)
         
        rectBlock:addEventListener("touch", rectBlockTouch)
    end
]]
end
