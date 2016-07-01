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
    	
    	
    	--calls the chosen pieces
    	local chimeraGroup = event.params.myGroup
    	sceneGroup:insert(chimeraGroup)
		
    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
   
	
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
    
    local dragonLeg = display.newImageRect("images/dragon-leg.png", 140,185)
    dragonLeg.x=140
    dragonLeg.y=130
    dragonLeg.legtype=1
    dragonLeg.yScale=-1
    sceneGroup:insert(dragonLeg)
    
    local shoesLeg = display.newImageRect("images/shoes-leg.png",200, 175)
    shoesLeg.x=405
    shoesLeg.y=130
    shoesLeg.legtype=2
    shoesLeg.yScale=-1
    sceneGroup:insert(shoesLeg)
    
    local wheelLeg = display.newImageRect("images/wheel-leg.png", 180,180)
    wheelLeg.x=635
    wheelLeg.y=130
	wheelLeg.legtype=3
	wheelLeg.yScale=-1
    sceneGroup:insert(wheelLeg)
    
    ------------------RIGHT SIDE UPS
    
    local tigerLeg = display.newImageRect("images/tiger-leg.png", 180, 190)
    tigerLeg.x=160
    tigerLeg.y=900
    tigerLeg.legtype=4
    tigerLeg.xScale=-1
    sceneGroup:insert(tigerLeg)
    
    local spiderLeg = display.newImageRect("images/spider-leg.png", 200, 175)
    spiderLeg.x=384
    spiderLeg.y=900
    spiderLeg.legtype=5
    sceneGroup:insert(spiderLeg)
    
    local elephantLeg = display.newImageRect("images/elephant-leg.png", 140, 190)
    elephantLeg.x=630
    elephantLeg.y=900
    elephantLeg.legtype=6
    sceneGroup:insert(elephantLeg)
    
    -------------------BODY OUTLINE PARTS
    
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
	
	chimeraGroup:toFront()
    
    local function snapToLegs (event)
    	
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
    			dragonLeg.x=1000
    			dragonLeg.y=900
    			dragonLeg.width=10
    			dragonLeg.height=10
    			dragonLeg.isVisible=false
    			local staticDragon=display.newImageRect("images/dragon-leg.png", 140,185)
    			staticDragon.x=140
    			staticDragon.y=130
    			staticDragon.yScale=-1
    			sceneGroup:insert(staticDragon)
    			
    			
    		end
    		
    		local function demolish2 (event)
    			shoesLeg.x=1000
    			shoesLeg.y=900
    			shoesLeg.width=10
    			shoesLeg.height=10
    			shoesLeg.isVisible=false
    			local staticShoes=display.newImageRect("images/shoes-leg.png", 200,175)
    			staticShoes.x=405
    			staticShoes.y=130
    			staticShoes.yScale=-1
    			sceneGroup:insert(staticShoes)
    			
    		end
    		
    		local function demolish3 (event)
    			wheelLeg.x=1000
    			wheelLeg.y=900
    			wheelLeg.width=10
    			wheelLeg.height=10
    			wheelLeg.isVisible=false
    			local staticWheel=display.newImageRect("images/wheel-leg.png", 180, 180)
    			staticWheel.x=635
    			staticWheel.y=130
    			staticWheel.yScale=-1
    			sceneGroup:insert(staticWheel)
    			
    		end
    	
    		local function demolish4 (event)
    			tigerLeg.x=1000
    			tigerLeg.y=900
    			tigerLeg.width=10
    			tigerLeg.height=10
    			tigerLeg.isVisible=false
    			local staticTiger=display.newImageRect("images/tiger-leg.png", 180, 190)
    			staticTiger.x=160
    			staticTiger.y=900
    			staticTiger.xScale=-1
    			sceneGroup:insert(staticTiger)
    			
    		end
    		
    		local function demolish5 (event)
    			spiderLeg.x=1000
    			spiderLeg.y=900
    			spiderLeg.width=10
    			spiderLeg.height=10
    			spiderLeg.isVisible=false
    			local staticSpider=display.newImageRect("images/spider-leg.png", 200, 175)
    			staticSpider.x=384
    			staticSpider.y=900
    			sceneGroup:insert(staticSpider)
    		
    		end
    		
    		local function demolish6 (event)
    			elephantLeg.x=1000
    			elephantLeg.y=900
    			elephantLeg.width=10
    			elephantLeg.height=10
    			elephantLeg.isVisible=false
    			local staticElephant=display.newImageRect("images/elephant-leg.png", 140, 190)
    			staticElephant.x=630
    			staticElephant.y=900
    			sceneGroup:insert(staticElephant)
    		end
    		
    		
    		
    	
    		if (event.target.legtype == 1) then
    	
    			if (event.target.y > 325) then
    				dragonLeg.x=1000
    				dragonLeg.y=900
    				dragonLeg.width=10
    				dragonLeg.height=10
    				dragonLeg.isVisible = false
    				local newDragon = display.newImageRect("images/dragon-leg.png",170,270)
    				newDragon.x=640
    				newDragon.y=390
    				newDragon.xScale=-1
    				newDragon.rotation = -90
    				chimeraGroup:insert(newDragon)
    				udMoved = true
    				bodyLegLeft.isVisible = false
    			end
    			demolish2()
    			demolish3()
    			
    			
    			
    		end
    		 
    		if (event.target.legtype == 2) then
    			
    			if (event.target.y > 325) then
    				shoesLeg.x=1000
    				shoesLeg.y=900
    				shoesLeg.width=10
    				shoesLeg.height=10
    				shoesLeg.isVisible=false
    				local newShoes = display.newImageRect("images/shoes-leg.png",300,300)
    				newShoes.x=615
    				newShoes.y=310 
    				newShoes.rotation=-95
    				chimeraGroup:insert(newShoes)
    				udMoved = true
    				bodyLegLeft.isVisible = false
    			end
    			demolish1()
    			demolish3()
    			
    			
    			
    		end
    		
    		if (event.target.legtype == 3) then
    			
    			if (event.target.y > 325) then
    				wheelLeg.x=1000
    				wheelLeg.y=9000
    				wheelLeg.width=10
    				wheelLeg.height=10
    				wheelLeg.isVisible=false
    				local  newWheel= display.newImageRect("images/wheel-leg.png",230,230)
    				newWheel.x=635
    				newWheel.y=380 
    				--newWheel.rotation=-90
    				chimeraGroup:insert(newWheel)
    				udMoved = true
    				bodyLegLeft.isVisible = false
    			end
    			demolish1()
    			demolish2()
    			
    			
    		end
    		
    		if (event.target.legtype == 4) then
    			
    			if (event.target.y < 700) then
    				tigerLeg.x=1000
    				tigerLeg.y=9000
    				tigerLeg.width=10
    				tigerLeg.height=10
    				tigerLeg.isVisible=false
    				local newTiger = display.newImageRect("images/tiger-leg.png", 270,270)
    				newTiger.x=635
    				newTiger.y=550
    				newTiger.xScale=-1
    				newTiger.rotation=-95
    				chimeraGroup:insert(newTiger)
    				rsuMoved = true
    				bodyLegRight.isVisible = false
    			end
    			
    			demolish5()
    			demolish6()
    			
    		end
    		
    		if (event.target.legtype == 5) then
    			
    			if (event.target.y < 700) then
    				spiderLeg.x=1000
    				spiderLeg.y=9000
    				spiderLeg.width=10
    				spiderLeg.height=10
    				spiderLeg.isVisible=false
    				local newSpider = display.newImageRect("images/spider-leg.png", 300,300)
    				newSpider.x=620
    				newSpider.y=670
    				newSpider.rotation=-95
    				chimeraGroup:insert(newSpider)
    				rsuMoved = true
    				bodyLegRight.isVisible = false
    			end
    			
    			demolish4()
    			demolish6()
    			
    		end
    		
    		if (event.target.legtype == 6) then
    			
    			if (event.target.y < 700) then
    				elephantLeg.x=1000
    				elephantLeg.y=9000
    				elephantLeg.width=10
    				elephantLeg.height=10
    				elephantLeg.isVisible=false
    				local newElephant = display.newImageRect("images/elephant-leg.png", 155,270)
    				newElephant.x=640
    				newElephant.y=600
    				--newElephant.yScale=1
    				newElephant.rotation=-90
    				chimeraGroup:insert(newElephant)
    				rsuMoved = true
    				bodyLegRight.isVisible = false
    			end
    			demolish4()
    			demolish5()
    			
    		end
    		
    	
    	end--end of event "moved"
    	
    	local function changeScene (event)
    		local options =
					{
						
						params = {
							myGroup = chimeraGroup
						}
					}
    		composer.gotoScene("ask", options)
    	end
    	
    	function createNextButton (event)
    		local nextButton = display.newImageRect("images/donebutton.png", 130,130)
    		nextButton.x=125
    		nextButton.y=690
    		sceneGroup:insert(nextButton)
    		
    		local nextText=display.newText("NEXT", 100,100, native.systemFontBold, 40)
			nextText.x=125
			nextText.y=690
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
    
    dragonLeg:addEventListener("touch", snapToLegs)
    shoesLeg:addEventListener("touch", snapToLegs)
    wheelLeg:addEventListener("touch", snapToLegs)
    tigerLeg:addEventListener("touch", snapToLegs)
    spiderLeg:addEventListener("touch", snapToLegs)
	elephantLeg:addEventListener("touch", snapToLegs)
	
    
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