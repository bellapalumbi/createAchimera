local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------

local chimeraGroup

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
    
    local chimeraGroup = event.params.myGroup
    	sceneGroup:insert(chimeraGroup)
    	

    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
    
    
    
    
    composer.removeScene("firstscene")
    ----------EMPTY OUTLINE
    --placeHolder=display.newImageRect("images/bodyoutline.png", 380, 560)
--	placeHolder.x=display.contentCenterX
--	placeHolder.y=display.contentCenterY-10
--	placeHolder.rotation = 270
--	sceneGroup:insert(chimeraGroup)
--	chimeraGroup:insert(placeHolder)
--	--sceneGroup:insert(placeHolder)
	 
	
	
	 
	----------EMPTY BOXES
	local itemFrame1=display.newImageRect("images/selection-box.png", 200,200)
	itemFrame1.x=140
	itemFrame1.y=900
	sceneGroup:insert(itemFrame1)
	
	local itemFrame2=display.newImageRect("images/selection-box.png", 200,200)
	itemFrame2.x=387
	itemFrame2.y=900
	sceneGroup:insert(itemFrame2)
	
	local itemFrame3=display.newImageRect("images/selection-box.png", 200,200)
	itemFrame3.x=635
	itemFrame3.y=900
	sceneGroup:insert(itemFrame3)

	----------TORSOS
	gorillaTorso=display.newImageRect("images/gorilla-torso.png",160,185)
	gorillaTorso.x=140
	gorillaTorso.y=900
	gorillaTorso.torsotype=1
	
	polkaTorso=display.newImageRect("images/polka-torso.png", 170,190)
	polkaTorso.x=385
	polkaTorso.y=900
	polkaTorso.torsotype=2
	
	beeTorso=display.newImageRect("images/bee-torso.png",170,190)
	beeTorso.x=635
	beeTorso.y=900
	beeTorso.torsotype=3
	
	
	----------NEXT BUTTON AND TEXT
	local nextButton=display.newImageRect("images/donebutton.png", 130, 130)
	nextButton.x=140
	nextButton.y=710
	sceneGroup:insert(nextButton)
	nextButton.isVisible = false
	
	local nextText=display.newText("NEXT", 100,100, native.systemFontBold, 40)
	nextText.x=140
	nextText.y=710
	nextText:setTextColor (0,0,0)
	sceneGroup:insert(nextText)
	
	--------CREATE EMPTY BODY OUTLINE PIECES
	
	local bodyLegRight = display.newImageRect("images/ghosts/ghost-leg-left.png", 105, 255)
	bodyLegRight.x=535
	bodyLegRight.y=593
	bodyLegRight.rotation = 270
	sceneGroup:insert(bodyLegRight)
	
	local bodyLegLeft = display.newImageRect("images/ghosts/ghost-leg-right.png", 105, 255)
	bodyLegLeft.x=535
	bodyLegLeft.y=410
	bodyLegLeft.rotation = 270
	sceneGroup:insert(bodyLegLeft)
	
	local bodyTorso = display.newImageRect("images/ghosts/ghost-torso.png", 260, 300)
	bodyTorso.x=display.contentCenterX - 10
	bodyTorso.y=display.contentCenterY - 12
	bodyTorso.rotation = 270
	--bodyTorso.alpha = 0.75
	sceneGroup:insert(bodyTorso)
	
	local bodyArmLeft = display.newImageRect("images/ghosts/ghost-arm-right.png", 130, 190)
	bodyArmLeft.x = 320
	bodyArmLeft.y = 395
	bodyArmLeft.rotation = 250
	sceneGroup:insert(bodyArmLeft)
	
	local bodyArmRight = display.newImageRect("images/ghosts/ghost-arm-left.png", 130, 190)
	bodyArmRight.x = 323
	bodyArmRight.y = 600
	bodyArmRight.rotation = -70
	sceneGroup:insert(bodyArmRight)
	
	local bodyHead = display.newImageRect ("images/ghosts/ghost-head.png", 130,115)
	bodyHead.x = 180
	bodyHead.y = 497
	sceneGroup:insert(bodyHead)
	
	
	
	-----------------------------------
	--FUNCTIONS
	-----------------------------------
	
	-----------snapTo
	function snapTo (event)
	
		function makeVisible (event)
				nextButton.isVisible = true
		end
			
						
		if event.phase == "began" then
			event.target.markX = event.target.x    -- store x location of object
			event.target.markY = event.target.y    -- store y location of object
			torsoPlaced=event.target.torsoName
		end
		
		function addTorsosToGroup (event)
			sceneGroup:insert(beeTorso)
			sceneGroup:insert(gorillaTorso)
			sceneGroup:insert(polkaTorso)
		end
		
		
		if event.phase == "moved" then
			local x = (event.x - event.xStart) + event.target.markX
			local y = (event.y - event.yStart) + event.target.markY
			event.target.x, event.target.y = x, y    -- move object based on calculations above
				
			function demolish1 (event)
				gorillaTorso.x = 1000
				gorillaTorso.y = 900
				gorillaTorso.width = 10
				gorillaTorso.length = 10
				gorillaTorso.isVisible = false
				local staticGorilla = display.newImageRect("images/gorilla-torso.png", 160, 180)
				staticGorilla.x=140
				staticGorilla.y=900
				sceneGroup:insert(staticGorilla)
			end
			
			function demolish2 (event)
				polkaTorso.x = 1000
				polkaTorso.y = 900
				polkaTorso.width = 10
				polkaTorso.length = 10
				polkaTorso.isVisible = false
				local staticPolka = display.newImageRect("images/polka-torso.png", 170, 190)
				staticPolka.x=385
				staticPolka.y=900
				sceneGroup:insert(staticPolka)
			end
			
			function demolish3 (event)
				beeTorso.x = 1000
				beeTorso.y = 900
				beeTorso.width = 10
				beeTorso.length = 10
				beeTorso.isVisible = false
				local staticBee = display.newImageRect("images/bee-torso.png", 170, 190)
				staticBee.x=635
				staticBee.y=900
				sceneGroup:insert(staticBee)
			end		
				
			if (event.target.torsotype == 1) then
				event.target.width = 380
				event.target.height = 410
				if event.target.y < 580 then
					event.target.isVisible = false
					local newTorso1 = display.newImageRect("images/gorilla-torso.png",380, 410)
					newTorso1.x=400
					newTorso1.y=500
					newTorso1.rotation = 270
					chimeraGroup:insert(newTorso1)
					
				end
				chimeraGroup:toFront()
				addTorsosToGroup()
				makeVisible()
				demolish2()
				demolish3()
				
			end
		
			if (event.target.torsotype == 2) then
				event.target.width = 380
				event.target.height = 410
				if event.target.y < 580 then
					event.target.isVisible = false
					local newTorso2 = display.newImageRect("images/polka-torso.png",380, 410)
					newTorso2.x=410
					newTorso2.y=500
					newTorso2.rotation = 270
					--newTorso2.alpha = 0.5
					chimeraGroup:insert(newTorso2)
					
				end
				chimeraGroup:toFront()
				addTorsosToGroup()
				makeVisible()
				demolish1()
				demolish3()
			end
			
			if (event.target.torsotype == 3) then
				event.target.width = 380
				event.target.height = 410
				if event.target.y < 580 then
					event.target.isVisible = false	
					local newTorso3 = display.newImageRect("images/bee-torso.png",380, 410)
					newTorso3.x=410
					newTorso3.y=500
					newTorso3.rotation = 270
					chimeraGroup:insert(newTorso3)
				end
				chimeraGroup:toFront()
				addTorsosToGroup()
				makeVisible()
				demolish1()
				demolish2()
			end
			
		end--end of event.phase == "began" statement
		
	end	-- end of snapTo	
				
		
	
	function nextButtonClicked (event)
		
		if event.phase=="ended" then
			function sceneChange (event)
				--chimeraGroup:remove(bodyTorso)
				local options =
					{
						
						params = {
							myGroup = chimeraGroup
						}
						
					}
				composer.gotoScene("thirdscene", options)
			end
			timer.performWithDelay(100, sceneChange)
		end
	end
	
	gorillaTorso:addEventListener( "touch", snapTo)
	polkaTorso:addEventListener( "touch", snapTo)
	beeTorso:addEventListener( "touch", snapTo)
	nextButton:addEventListener("touch", nextButtonClicked)
	
end
		
	
	
	--end
	
	----------nextButtonClicked
	
	
	
	--end of nextButtonClicked
	
	--end functions
	--event listeners
	
	
	--end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene