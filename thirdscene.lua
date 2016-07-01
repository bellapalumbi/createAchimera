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
  
    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
    
    local group=display.newGroup()
    composer.removeScene("secondscene")
    sceneGroup:insert(chimeraGroup)
    
    -------Set up green buttons
    local greenButton3=display.newImageRect("images/green-dim.png", 520,60)
	sceneGroup:insert(greenButton3)
	greenButton3.x=display.contentCenterX
	greenButton3.y=(970)
	--greenButton3.button = 3
	
	local greenButton2=display.newImageRect("images/green-dim.png", 520,60)
	sceneGroup:insert(greenButton2)
	greenButton2.x=display.contentCenterX
	greenButton2.y=(870)
	--greenButton2.button = 2
	
	local greenButton1=display.newImageRect("images/green-dim.png", 520,60)
	sceneGroup:insert(greenButton1)
	greenButton1.x=display.contentCenterX
	greenButton1.y=(770)
	--greenButton1.button = 1
	--------SET UP RED BUTTONS
	local redButton1=display.newImageRect("images/red-unclicked.png",520,60)
	sceneGroup:insert(redButton1)
	redButton1.x=display.contentCenterX
	redButton1.y=(40)
	redButton1.button = 1
	
	local redButton2=display.newImageRect("images/red-unclicked.png",520,60)
	sceneGroup:insert(redButton2)
	redButton2.x=display.contentCenterX
	redButton2.y=(140) 
	redButton2.button = 2

	local redButton3=display.newImageRect("images/red-unclicked.png",520,60)
	sceneGroup:insert(redButton3)
	redButton3.x=display.contentCenterX
	redButton3.y=(240)
	redButton3.button = 3
	
	---------------TEXT
	---Questions
	local question1green=display.newText("The other person is feeling...", 0,0,native.systemFontBold, 40)
	sceneGroup:insert(question1green)
	question1green.x=display.contentCenterX
	question1green.y=(705)

	local question1red=display.newText("How are you feeling?", 0,0,native.systemFontBold, 40)
	sceneGroup:insert(question1red)
	question1red.x=display.contentCenterX
	question1red.y=(300)
	question1red.rotation = 180
	
	---Answers
	--Green
	local answer1green=display.newText("Sad",0,0,native.systemFontBold, 40)
	sceneGroup:insert(answer1green)
	answer1green.x=display.contentCenterX
	answer1green.y=(773)
	
	local answer2green=display.newText("Angry",0,0,native.systemFontBold, 40)
	sceneGroup:insert(answer2green)
	answer2green.x=display.contentCenterX
	answer2green.y=(870)
	
	local answer3green=display.newText("Confused",0,0,native.systemFontBold, 40)
	sceneGroup:insert(answer3green)
	answer3green.x=display.contentCenterX
	answer3green.y=(973)

	--Red
	local answer1red=display.newText("Sad",0,0,native.systemFontBold, 40)
	sceneGroup:insert(answer1red)
	answer1red.x=display.contentCenterX
	answer1red.y=(238)
	answer1red.rotation = 180
	
	local answer2red=display.newText("Angry",0,0,native.systemFontBold, 40)
	sceneGroup:insert(answer2red)
	answer2red.x=display.contentCenterX
	answer2red.y=(141)
	answer2red.rotation = 180
	
	local answer3red=display.newText("I don't know",0,0,native.systemFontBold, 40)
	sceneGroup:insert(answer3red)
	answer3red.x=display.contentCenterX
	answer3red.y=(38)
	answer3red.rotation = 180
	
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
---------HERE IS THE END OF THE SCENE:CREATE FUNCTION

function moveTextToFront (event)
		answer1green:toFront()
		answer2green:toFront()
		answer3green:toFront()
		answer1red:toFront()
		answer2red:toFront()
		answer3red:toFront()
	end
---------------------------------------------------------
--BEGININNING OF RESULTS CREATION (SETUP)
---------------------------------------------------------

local function buttonClicked (event)
	print("button has been clicked")
	function createGray1 (event)
		local gray1=display.newImageRect("images/grayUD.png", 520,60)
		gray1.x=display.contentCenterX
		gray1.y=(970)
		sceneGroup:insert(gray1)
	end
	
	function createGray2 (event)
		local gray2=display.newImageRect("images/grayUD.png", 520,60)
		gray2.x=display.contentCenterX
		gray2.y=(870)
		sceneGroup:insert(gray2)
	end
	
	function createGray3 (event)
		local gray3=display.newImageRect("images/grayUD.png", 520,60)
		gray3.x=display.contentCenterX
		gray3.y=(770)
		sceneGroup:insert(gray3)
	end
	
	function createGray4 (event)
		local gray4=display.newImageRect("images/grayUD.png", 520,60)
		gray4.x=display.contentCenterX
		gray4.y=(240)
		sceneGroup:insert(gray4)
	end
	
	function createGray5 (event)
		local gray5=display.newImageRect("images/grayUD.png", 520,60)
		gray5.x=display.contentCenterX
		gray5.y=(140)
		sceneGroup:insert(gray5)
	end
	
	function createGray6 (event)
		local gray6=display.newImageRect("images/grayUD.png", 520,60)
		gray6.x=display.contentCenterX
		gray6.y=(40)
		sceneGroup:insert(gray6)
	end

	function firstClicked (event)
		local redClicked1=display.newImageRect("images/red-clicked.png", 520,60)
		redClicked1.x=display.contentCenterX
		redClicked1.y=(240)
		sceneGroup:insert(redClicked1)
		local greenClicked1=display.newImageRect("images/green-clicked.png", 520,60)
		greenClicked1.x=display.contentCenterX
		greenClicked1.y=(770)
		sceneGroup:insert(greenClicked1)
	end
	
	function secondClicked (event)
		local redClicked2=display.newImageRect("images/red-clicked.png", 520,60)
		redClicked2.x=display.contentCenterX
		redClicked2.y=(140)
		sceneGroup:insert(redClicked2)
		local greenClicked2=display.newImageRect("images/green-clicked.png", 520,60)
		greenClicked2.x=display.contentCenterX
		greenClicked2.y=(870)
		sceneGroup:insert(greenClicked2)
	end
	
	function thirdClicked (event)
		local redClicked3=display.newImageRect("images/red-clicked.png", 520,60)
		redClicked3.x=display.contentCenterX
		redClicked3.y=(40)
		sceneGroup:insert(redClicked3)
		local greenClicked3=display.newImageRect("images/green-clicked.png", 520,60)
		greenClicked3.x=display.contentCenterX
		greenClicked3.y=(970)
		sceneGroup:insert(greenClicked3)
	end
	print"button is still activated"
	
	local function nextScene (event)	
		local options =
					{
						
						params = {
							myGroup = chimeraGroup
						}
					}
		composer.gotoScene("buildscene2", options)
	end
	
---------------------------------------------------------
--END OF RESULTS CREATION (SETUP)
---------------------------------------------------------
	function removeFirstButtons (event)
		greenButton1:removeSelf()
		greenButton1 = nil
		greenButton2:removeSelf()
		greenButton2 = nil
		greenButton3:removeSelf()
		greenButton3 = nil
		redButton1:removeSelf()
		redButton1 = nil
		redButton2:removeSelf()
		redButton2 = nil
		redButton3:removeSelf()
		redButton3 = nil
	end


	if (event.target.button == 3) then
		print"button=3"
		removeFirstButtons()
		firstClicked()
		createGray1()
		createGray2()
		createGray5()
		createGray6()
		moveTextToFront()
		timer.performWithDelay(500, nextScene)
	end
	
	if (event.target.button == 2) then
		print"button=2"
		removeFirstButtons()
		secondClicked()
		createGray1()
		createGray3()
		createGray4()
		createGray6()
		moveTextToFront()
		timer.performWithDelay(500, nextScene)
	end
	
	if (event.target.button == 1) then
		print"button=1"
		removeFirstButtons()
		thirdClicked()
		createGray2()
		createGray3()
		createGray4()
		createGray5()
		moveTextToFront()
		timer.performWithDelay(500, nextScene)
	end
	
	

end --this is the end of the buttonClicked function


redButton1:addEventListener("touch", buttonClicked)
redButton2:addEventListener("touch", buttonClicked)
redButton3:addEventListener("touch", buttonClicked)
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