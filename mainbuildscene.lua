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
   
	local placementCount = 0
	local rsuMoved = false
	local udMoved = false
--   
--    
---------------------------------------------------------------------------
--FRAMES
---------------------------------------------------------------------------
	local frame1 = display.newImageRect("images/selection-box.png", 200,200)
	frame1.x=140
	frame1.y=130
	sceneGroup:insert(frame1)
	  
	local frame2 = display.newImageRect("images/selection-box.png", 200,200)
	frame2.x=387
	frame2.y=130
	sceneGroup:insert(frame2)
	  
	local frame3 = display.newImageRect("images/selection-box.png", 200,200)
	frame3.x=635
	frame3.y=130
	sceneGroup:insert(frame3)
	  
	local frame4 = display.newImageRect("images/selection-box.png", 200,200)
	frame4.x=140
	frame4.y=900
	sceneGroup:insert(frame4)
	  
	local frame5 = display.newImageRect("images/selection-box.png", 200,200)
	frame5.x=387
	frame5.y=900
	sceneGroup:insert(frame5)
	  
	local frame6 = display.newImageRect("images/selection-box.png", 200,200)
	frame6.x=635
	frame6.y=900
	sceneGroup:insert(frame6)
	  
---------------------------------------------------------------------------
--PARTS
---------------------------------------------------------------------------
    
    -----------------UPSIDE DOWNS
    
    local octopusArm = display.newImageRect("images/octopus-arm.png", 187,150)
    octopusArm.x=153
    octopusArm.y=120
    octopusArm.yScale=-1
    octopusArm.rotation = -20
    octopusArm.armtype=1
    sceneGroup:insert(octopusArm)
    
    local butterflyArm = display.newImageRect("images/butterfly-arm.png",140, 180)
    butterflyArm.x=400
    butterflyArm.y=136
    --butterflyArm.yScale=-1
    butterflyArm.armtype=2
    butterflyArm.xScale = -1
    butterflyArm.rotation = -15
    sceneGroup:insert(butterflyArm)
    
    local cheetahArm = display.newImageRect("images/cheetah-arm.png", 170,170)
    cheetahArm.x=635
    cheetahArm.y=130
    cheetahArm.yScale=-1
	cheetahArm.armtype=3
    sceneGroup:insert(cheetahArm)
    
    ------------------RIGHT SIDE UPS
    
    local wingArm = display.newImageRect("images/wing-arm.png", 208, 158)
    wingArm.x=140
    wingArm.y=900
    wingArm.xScale=-1
    wingArm.rotation = -23
    wingArm.armtype=4
    sceneGroup:insert(wingArm)
    
    local crabArm = display.newImageRect("images/crab-arm.png", 200, 175)
    crabArm.x=387
    crabArm.y=900
    crabArm.armtype=5
    sceneGroup:insert(crabArm)
    
    local robotArm = display.newImageRect("images/robot-arm.png", 190, 180)
    robotArm.x=635
    robotArm.y=900
    robotArm.armtype=6
    sceneGroup:insert(robotArm)
    
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
	
	
	chimeraGroup:toFront()
    
    local function snapToArms (event)
    	
    	if event.phase == "began" then
			event.target.markX = event.target.x    -- store x location of object
			event.target.markY = event.target.y    -- store y location of object
			torsoPlaced=event.target.torsoName
		end
		
		
		if event.phase == "moved" then
			local x = (event.x - event.xStart) + event.target.markX
			local y = (event.y - event.yStart) + event.target.markY
			event.target.x, event.target.y = x, y    -- move object based on calculations above
			
    		local function demolish1 (event)
    			octopusArm.x=1000
    			octopusArm.y=900
    			octopusArm.width=10
    			octopusArm.height=10
    			octopusArm.isVisible=false
    			local staticOctopus=display.newImageRect("images/octopus-arm.png", 187,150)
    			staticOctopus.x=153
    			staticOctopus.y=120
    			staticOctopus.yScale=-1
    			staticOctopus.rotation = -20
    			sceneGroup:insert(staticOctopus)
    			
    		end
    		
    		local function demolish2 (event)
    			butterflyArm.x=1000
    			butterflyArm.y=900
    			butterflyArm.width=10
    			butterflyArm.height=10
    			butterflyArm.isVisible=false
    			local staticButterfly=display.newImageRect("images/butterfly-arm.png", 140,180)
    			staticButterfly.x=400
    			staticButterfly.y=136
    			staticButterfly.xScale=-1
    			staticButterfly.rotation = -15
    			sceneGroup:insert(staticButterfly)
    			
    		end
    		
    		local function demolish3 (event)
    			cheetahArm.x=1000
    			cheetahArm.y=900
    			cheetahArm.width=10
    			cheetahArm.height=10
    			cheetahArm.isVisible=false
    			local staticCheetah=display.newImageRect("images/cheetah-arm.png", 170, 170)
    			staticCheetah.x=635
    			staticCheetah.y=130
    			staticCheetah.yScale=-1
    			sceneGroup:insert(staticCheetah)
    			
    		end
    	
    		local function demolish4 (event)
    			wingArm.x=1000
    			wingArm.y=900
    			wingArm.width=10
    			wingArm.height=10
    			wingArm.isVisible=false
    			local staticWing=display.newImageRect("images/wing-arm.png", 208, 158)
    			staticWing.x=140
    			staticWing.y=900
    			staticWing.xScale=-1
    			staticWing.rotation = -23
    			sceneGroup:insert(staticWing)
    			
    		end
    		
    		local function demolish5 (event)
    			crabArm.x=1000
    			crabArm.y=900
    			crabArm.width=10
    			crabArm.height=10
    			crabArm.isVisible=false
    			local staticCrab=display.newImageRect("images/crab-arm.png", 200, 175)
    			staticCrab.x=387
    			staticCrab.y=900
    			sceneGroup:insert(staticCrab)
    			
    		end
    		
    		local function demolish6 (event)
    			robotArm.x=1000
    			robotArm.y=900
    			robotArm.width=10
    			robotArm.height=10
    			robotArm.isVisible=false
    			local staticRobot=display.newImageRect("images/robot-arm.png", 190, 180)
    			staticRobot.x=635
    			staticRobot.y=900
    			sceneGroup:insert(staticRobot)
    			
    		end
    		
    		
    		
    	
    		if (event.target.armtype == 1) then
    	
    			if (event.target.y > 325) then
    				octopusArm.x=1000
    				octopusArm.y=900
    				octopusArm.width=10
    				octopusArm.height=10
    				octopusArm.isVisible = false
    				local newOctopus = display.newImageRect("images/octopus-arm.png", 300,250)
    				newOctopus.x = 365
    				newOctopus.y = 390
    				newOctopus.rotation = -50
    				udMoved = true
    				chimeraGroup:insert(newOctopus)
    				bodyArmLeft.isVisible = false
    			end
    			demolish2()
    			demolish3()
    			
    			
    		end
    		 
    		if (event.target.armtype == 2) then
    			
    			if (event.target.y > 325) then
    				butterflyArm.x=1000
    				butterflyArm.y=900
    				butterflyArm.width=10
    				butterflyArm.height=10
    				butterflyArm.isVisible=false
    				local newButterfly = display.newImageRect("images/butterfly-arm.png",300,450)
    				newButterfly.x=400
    				newButterfly.y=270
    				newButterfly.xScale = -1
    				--newButterfly.yScale = -1
    				newButterfly.rotation=-117
    				udMoved = true
    				
    				chimeraGroup:insert(newButterfly)
    				newButterfly:toBack()
    				bodyArmLeft.isVisible = false
    			end
    			demolish1()
    			demolish3()
    			
    			
    		end
    		
    		if (event.target.armtype == 3) then
    			
    			if (event.target.y > 325) then
    				cheetahArm.x=1000
    				cheetahArm.y=9000
    				cheetahArm.width=10
    				cheetahArm.height=10
    				cheetahArm.isVisible=false
    				local newCheetah = display.newImageRect("images/cheetah-arm.png", 300, 250)
    				newCheetah.x=365
    				newCheetah.y=435
    				newCheetah.yScale=-1
    				newCheetah.xScale=-1
    				udMoved = true
    				newCheetah.rotation=75
    				chimeraGroup:insert(newCheetah)
    				bodyArmLeft.isVisible = false
    			end
    			demolish1()
    			demolish2()
    			
    			
    		end
    		
    		if (event.target.armtype == 4) then
    			
    			if (event.target.y < 650) then
    				wingArm.x=1000
    				wingArm.y=9000
    				wingArm.width=10
    				wingArm.height=10
    				wingArm.isVisible=false
    				local newWing = display.newImageRect("images/wing-arm.png", 300,250)
    				newWing.x=365
    				newWing.y=650
    				newWing.yScale=-1
    				newWing.rotation=55
    				rsuMoved = true
    				chimeraGroup:insert(newWing)
    				bodyArmRight.isVisible = false
    			end
    			
    			demolish5()
    			demolish6()
    			
    		end
    		
    		if (event.target.armtype == 5) then
    			
    			if (event.target.y < 650) then
    				crabArm.x=1000
    				crabArm.y=9000
    				crabArm.width=10
    				crabArm.height=10
    				crabArm.isVisible=false
    				local newCrab = display.newImageRect("images/crab-arm.png", 300,250)
    				newCrab.x=330
    				newCrab.y=585
    				newCrab.yScale=1
    				newCrab.rotation=-85
    				rsuMoved = true
    				chimeraGroup:insert(newCrab)
    				bodyArmRight.isVisible = false
    			end
    			
    			demolish4()
    			demolish6()
    			
    		end
    		
    		if (event.target.armtype == 6) then
    			
    			if (event.target.y < 650) then
    				robotArm.x=1000
    				robotArm.y=9000
    				robotArm.width=10
    				robotArm.height=10
    				robotArm.isVisible=false
    				local newRobot = display.newImageRect("images/robot-arm.png", 315,250)
    				newRobot.x=330
    				newRobot.y=550
    				newRobot.yScale=1
    				newRobot.rotation=-85
    				rsuMoved = true
    				chimeraGroup:insert(newRobot)
    				bodyArmRight.isVisible = false
    			end
    			demolish4()
    			demolish5()
    			
    		end
    		
    	
    	end--end of event "moved"
    	
    	local function changeScene (event)
    	
    	--when composer goes to the next scene, options is called too. 
    	--options adds something called params which names "myGroup" as "chimeraGroup"
    	-- in the beginning of next scene, you can make a new object called "chimeraGroup" 
    	--(it could be called anything) that is equal to event.params.myGroup
    	--which is, of course, chimeraGroup.
    	--Then you can add the chosen chimera pieces to chimeraGroup and they will be saved as
    	--myGroup, which is called every new scene in params. Ta-Da!
    	
    		local options =
					{
						
						params = {
							myGroup = chimeraGroup
						}
					}
    		composer.gotoScene("mainbuildscene2",options)
    	end
    	
    	function createNextButton (event)
    		local nextButton = display.newImageRect("images/donebutton.png", 130,130)
    		nextButton.x=685
    		nextButton.y=707
    		sceneGroup:insert(nextButton)
    		
    		local nextText=display.newText("NEXT", 100,100, native.systemFontBold, 40)
			nextText.x=685
			nextText.y=707
			nextText:setTextColor (0,0,0)
			sceneGroup:insert(nextText)
			
			nextButton:addEventListener("touch", changeScene)
    	end
    	
    	
    	
    	if (rsuMoved == true) then
    		if (udMoved == true) then
    			print("success")
    			timer.performWithDelay(300,createNextButton)
    			
    		end
    	end
    
    
    end--end of snapToArms
    
    octopusArm:addEventListener("touch", snapToArms)
    butterflyArm:addEventListener("touch", snapToArms)
    cheetahArm:addEventListener("touch", snapToArms)
    wingArm:addEventListener("touch", snapToArms)
    crabArm:addEventListener("touch", snapToArms)
	robotArm:addEventListener("touch", snapToArms)
	
    
end --end of scene:create()


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