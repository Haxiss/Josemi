soundTable =  { 
audio.loadSound("sounds/20_porros_burlaos.wav"),
audio.loadSound("sounds/eresUnPayaso.wav"),
audio.loadSound("sounds/cara_xupada.wav"),
audio.loadSound("sounds/piva_disfruta.wav"),
audio.loadSound("sounds/miedo_morir.wav"),
audio.loadSound("sounds/estoyBurlao.wav"),
audio.loadSound("sounds/isTheJungleNigga.wav"), 
audio.loadSound("sounds/maricas_tronista.wav"),

audio.loadSound("sounds/tiroEnLaRodilla.wav"),
audio.loadSound("sounds/meLaSuda.wav"),
audio.loadSound("sounds/noMeAcelero.wav"),
audio.loadSound("sounds/lol.wav"),
audio.loadSound("sounds/profesores_avispao.wav"),
audio.loadSound("sounds/miraleElNiggie.wav"),
audio.loadSound("sounds/padre_capon.wav"),
audio.loadSound("sounds/noSoyUnNiño.wav"),

audio.loadSound("sounds/pasmao_atontao.wav"),
audio.loadSound("sounds/suerte.wav"),
audio.loadSound("sounds/quedasConmigo.wav"),
audio.loadSound("sounds/laPutaTele.wav"),
audio.loadSound("sounds/nada.wav"),
audio.loadSound("sounds/tonto_dios.wav"),
audio.loadSound("sounds/vida_mierda.wav"),
audio.loadSound("sounds/yoSoyFeliz.wav"),

audio.loadSound("sounds/soysTanBravos.wav"),
audio.loadSound("sounds/aquiHayWalthers.wav"),
audio.loadSound("sounds/compadre.wav"),
audio.loadSound("sounds/calleAguilon9.wav"),
audio.loadSound("sounds/conMisNegros.wav"),
audio.loadSound("sounds/cuidao.wav"),
audio.loadSound("sounds/chivatoDeMierda.wav"),
audio.loadSound("sounds/jodidosMaricones.wav"),

audio.loadSound("sounds/dandoVueltas.wav"),
audio.loadSound("sounds/envidia_mala.wav"),
audio.loadSound("sounds/mierda_no_gusta.wav"),
audio.loadSound("sounds/no_esnifo.wav"),
audio.loadSound("sounds/noMeSuenas.wav"),
audio.loadSound("sounds/pagafantas.wav"),
audio.loadSound("sounds/pitbulls.wav"),
audio.loadSound("sounds/pivudo.wav"),

audio.loadSound("sounds/pajas.wav"),
audio.loadSound("sounds/querer.wav"),
audio.loadSound("sounds/trapo.wav"),
audio.loadSound("sounds/jefe.wav"),
audio.loadSound("sounds/guarra.wav"),
audio.loadSound("sounds/fuerte.wav"),
audio.loadSound("sounds/calentando.wav"),
audio.loadSound("sounds/beso.wav"),
}

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
"Conmigo",
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
    
    pageMax = 6
    
    numPagesText = display.newText(groupName,  pageNum.."/"..pageMax, cx, bottomMarg-560, fontText, 60 )
    numPagesText:setFillColor( 0,0,0 )

    for i=1, 8 do
        
        if i < 5 then 
            btnX = display.contentWidth/4*i-100
            btnY = bottomMarg-400
        else
            btnX = display.contentWidth/4*(i-4)-100
            btnY = bottomMarg-150
        end

        text[i] = display.newText( groupName, textTable[numSound], btnX, btnY+110, fontText, fontTextSize )
        text[i]:setFillColor( 1,1,1 )
        
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

        groupName:insert(button[i])

        function buttonTouch(event)
            if ( event.phase == "began" )  then
                button[i]:setSequence("pressed")
                audio.stop()
                tmrBtnDefault=timer.performWithDelay( 1000, function ( )button[i]:setSequence("default") end )
            elseif ( event.phase == "ended" )  then
                soundPlaying = true
                button[i]:setSequence("default")
                personaje:setSequence( "bailoteo1" )
                cleanTimers()
                tmrSwapSprite=timer.performWithDelay( 600, swapSheet )
                personaje:play()
                if numBtn>15 then
                    --ads:setCurrentProvider( "admob" )
                    ads.show("interstitial", { testMode=true })
                    --ads:setCurrentProvider( "vungle" )
                    numBtn = 0
                else 
                    numBtn = numBtn + 1
                end
                print(numBtn)
                print( textTable[button[i].id] )
                analytics.logEvent(textTable[button[i].id])
                sonidoChannel= audio.play(soundTable[button[i].id], {onComplete=soundListener})
            end
        end
        button[i]:addEventListener("touch",buttonTouch)
        numSound = numSound + 1
        
    end
end

function cleanScene(numSound)
    currScene = composer.getSceneName( "current" )
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

function blockedPage()
--[[
    local t = loadTable( "data.json" )

    currScene = composer.getSceneName( "current" )
    
    if t.lock1 and (currScene=="scripts.sonidos3") then

        --ads:setCurrentProvider( "vungle" )

        rectBlock = display.newImageRect( group, "images/rectBlocked.png", display.contentWidth, 604 )
        rectBlock.x, rectBlock.y = cx, bottomMarg-300
          local options = {
            text = "Ver vídeo para desbloquear 24 sonidos más",
            parent = group,
            x = cx, 
            y = bottomMarg-400, 
            font = fontText,
            fontSize = 60,
            width= display.contentWidth-100,
            align="center"
            }

         textBlocked = display.newText(options)
    
        rectBlock:addEventListener("touch", rectBlockTouch)
        textBlocked = display.newText(options)
    end

    if t.lock1 and (currScene=="scripts.sonidos4" or currScene=="scripts.sonidos5") then
        rectBlock = display.newRect( group, cx, bottomMarg-300, display.contentWidth, 604 )
        rectBlock:setFillColor( 0,0,0,0.6 )

        rectBlock:addEventListener("touch", rectBlockTouch2)
    end

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