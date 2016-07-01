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
    
    local chimeraGroup = event.params.myGroup
    sceneGroup:insert(chimeraGroup)

    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
    
    --local group = display.newGroup()
    --composer.removeScene("thirdscene")
    
    local snapToDone = false
     
	----------EMPTY BOXES
	local itemFrame1=display.newImageRect("images/selection-box.png", 200,200)
	itemFrame1.x=140
	itemFrame1.y=130
	sceneGroup:insert(itemFrame1)
	
	local itemFrame2=display.newImageRect("images/selection-box.png", 200,200)
	itemFrame2.x=387
	itemFrame2.y=130
	sceneGroup:insert(itemFrame2)
	
	local itemFrame3=display.newImageRect("images/selection-box.png", 200,200)
	itemFrame3.x=635
	itemFrame3.y=130
	sceneGroup:insert(itemFrame3)
	
	---------------HEADS
	local robotHead=display.newImageRect("images/robot-head.png", 195,180)
	robotHead.x=137
	robotHead.y=130
	robotHead.rotation = 180
	robotHead.headtype=1
	
	local rabbitHead=display.newImageRect("images/rabbit-head.png", 200, 180)
	rabbitHead.x=387
	rabbitHead.y=130
	rabbitHead.rotation = 180
	rabbitHead.headtype=2
	
	local dinoHead=display.newImageRect("images/dino-head.png", 210, 190)
	dinoHead.x=665
	dinoHead.y=140
	dinoHead.rotation = 180
	dinoHead.headtype=3
	
	-------------------OTHER
	
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
	
	chimeraGroup:toFront()
	
	function snapTo (event)
		
		
	
		function makeVisible (event)
				nextButton.isVisible = true
		end
			
						
		if event.phase == "began" then
			event.target.markX = event.target.x    -- store x location of object
			event.target.markY = event.target.y    -- store y location of object
			torsoPlaced=event.target.torsoName
		end
		
		function addHeadsToGroup (event)
			sceneGroup:insert(robotHead)
			sceneGroup:insert(rabbitHead)
			sceneGroup:insert(dinoHead)
		end
		
		
		if event.phase == "moved" then
			local x = (event.x - event.xStart) + event.target.markX
			local y = (event.y - event.yStart) + event.target.markY
			event.target.x, event.target.y = x, y    -- move object based on calculations above
			
			function demolish1 (event)
				robotHead.x = 1000
				robotHead.y = 900
				robotHead.width = 10
				robotHead.length = 10
				robotHead.isVisible = false
				sceneGroup:insert(robotHead)
				local staticRobot = display.newImageRect("images/robot-head.png", 195, 180)
				staticRobot.x=137
				staticRobot.y=130
				staticRobot.rotation = 180
				sceneGroup:insert(staticRobot)
			end
			
			function demolish2 (event)
				rabbitHead.x = 1000
				rabbitHead.y = 900
				rabbitHead.width = 10
				rabbitHead.length = 10
				rabbitHead.isVisible = false
				sceneGroup:insert(rabbitHead)
				local staticRabbit = display.newImageRect("images/rabbit-head.png", 200, 180)
				staticRabbit.x=387
				staticRabbit.y=130
				staticRabbit.rotation = 180
				sceneGroup:insert(staticRabbit)
			end
			
			function demolish3 (event)
				dinoHead.x = 1000
				dinoHead.y = 900
				dinoHead.width = 10
				dinoHead.length = 10
				dinoHead.isVisible = false
				sceneGroup:insert(dinoHead)
				local staticDino = display.newImageRect("images/dino-head.png", 210, 190)
				staticDino.x=665
				staticDino.y=140
				staticDino.rotation = 180
				sceneGroup:insert(staticDino)
			end	
			
			
				
			if (event.target.headtype == 1) then
				event.target.width = 220
				event.target.height = 200
				if event.target.y > 400 then
					event.target.isVisible = false
					local newHead1 = display.newImageRect("images/robot-head.png",220, 200)
					newHead1.x=150
					newHead1.y=500
					newHead1.rotation = 270
					chimeraGroup:insert(newHead1)
					snapToDone = true
				
				end
				addHeadsToGroup()
				makeVisible()
				demolish2()
				demolish3()
				
			end
			
		
			if (event.target.headtype == 2) then
				event.target.width = 340
				event.target.height = 240
				if event.target.y > 400 then
					event.target.isVisible = false
					local newHead2 = display.newImageRect("images/rabbit-head.png",340, 240)
					newHead2.x=140
					newHead2.y=500
					newHead2.rotation = 270
					chimeraGroup:insert(newHead2)
					snapToDone = true
				end
				addHeadsToGroup()
				makeVisible()
				demolish1()
				demolish3()
				
			end
			
			if (event.target.headtype == 3) then
				event.target.width = 280
				event.target.height = 250
				if event.target.y > 400 then
					event.target.isVisible = false	
					local newHead3 = display.newImageRect("images/dino-head.png",280, 250)
					newHead3.x=140
					newHead3.y=540
					newHead3.rotation = 270
					chimeraGroup:insert(newHead3)
					snapToDone = true
				end
				addHeadsToGroup()
				makeVisible()
				demolish1()
				demolish2()
				
			end
			
			
			if (snapToDone == true) then 
			bodyHead.isVisible = false
			print("yes")
			end
		
			local function nextButtonClicked2 (event)
		
				if event.phase=="ended" then
					function sceneChange (event)
						local options =
						{
						
							params = {
								myGroup = chimeraGroup
							}
						}
						
						composer.gotoScene("mainbuildscene", options)
						
					end
					
					
					sceneChange()
					
				end
			end
			nextButton:addEventListener("touch", nextButtonClicked2)
		end	
	end--end of snapTo
	
	
	
	robotHead:addEventListener( "touch", snapTo)
	rabbitHead:addEventListener( "touch", snapTo)
	dinoHead:addEventListener("touch", snapTo)
	
    
    
    
    
    
end -- end


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