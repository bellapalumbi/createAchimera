local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
    
    --calls the chosen pieces
    	local chimeraGroup = event.params.myGroup
    	sceneGroup:insert(chimeraGroup)
   
    ---------BACKGROUNDS
    local background1 = display.newImageRect("images/completePage.png", 500,800)
    background1.x=display.contentCenterX
    background1.y=display.contentCenterY/2
    background1.rotation = 90
    background1.yScale = -1
    sceneGroup:insert(background1)
    
    local background2 = display.newImageRect("images/completePage.png", 500, 800)
	background2.x=0
    background2.y=display.contentCenterY + display.contentCenterY/2
    background2.rotation = 90 
    background2.yScale = -1
    sceneGroup:insert(background2)
   
    local background3 = display.newImageRect("images/completePage.png", 500, 800)
	background3.x=display.contentCenterX + display.contentCenterX + 35
    background3.y=display.contentCenterY + display.contentCenterY/2
    background3.rotation = 90 
    background3.yScale = -1
    sceneGroup:insert(background3)
    
    local nextButton = display.newImageRect("images/donebutton.png", 220,220)
    	nextButton.x=650
    	nextButton.y=870
		sceneGroup:insert(nextButton)
    		
    local nextText = display.newText("Play Again", 100, 100, native.systemFontBold, 40)  	  		
    	nextText.x = 650
    	nextText.y = 870
    	nextText:setTextColor(0,0,0)
    	nextText.rotation = -90
    	sceneGroup:insert(nextText)
    	
    runAgain = true
    if (runAgain == true) then
    print("changed at end of completeScene")
    end
    	
    function resetGame (event)
    	
    	--chimeraGroup:removeSelf()
--    	
--    	function resetFuncDelayed (event)
--    		composer.gotoScene ("main")
--    	end
--    	
--    	timer.performWithDelay(500, resetFuncDelayed)
		
		
		
--		chimeraGroup:removeSelf()
		--myGroup:removeSelf()
		
		
		--if (runAgain == true) then
--			print("runAgain true at end of completeScreen")
--			display.remove( chimeraGroup )
--			chimeraGroup = nil
--		end
		
		--composer.removeScene("main")
    	composer.removeScene("firstscene")
    	composer.removeScene("buildscene1")
    	composer.removeScene("thirdscene")
    	composer.removeScene("buildscene2")
    	composer.removeScene("ask")
    	composer.removeScene ("mainbuildscene")
    	composer.removeScene ("mainbuildscene2")
    	composer.gotoScene("homeScreen")
    end
    
    
    --local sheetOptions =
--		{
--    		width = 512,
--   			height = 256,
--    		numFrames = 3
--		}
--		
--	local sheet_fireworkA = graphics.newImageSheet( "fireworkA1.png", sheetOptions )
--		
--	local sequences_fireworkA = {
--    -- consecutive frames sequence
--    	{
--       		name = "normalFirework",
--        	start = 1,
--        	count = 3,
--        	time = 800,
--        	loopCount = 0,
--        	loopDirection = "forward"
--    	}
--	}
--
--local fireworkA = display.newSprite( sheet_fireworkA, sequences_fireworkA )
--fireworkA:play()
--    
    background1:toBack()
    background2:toBack()
    background3:toBack()
    
    nextButton:addEventListener("touch", resetGame)
    
    
    
											
    
    --chimeraGroup.x = display.contentCenterX
	--chimeraGroup.y = display.contentCenterY
    
end


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