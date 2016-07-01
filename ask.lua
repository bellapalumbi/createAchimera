local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
	
	local chimeraGroup = event.params.myGroup
    
	
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
	
	local askQuestionButton=display.newImageRect("images/green-unclicked.png", 680,100)
	sceneGroup:insert(askQuestionButton)
	askQuestionButton.x=display.contentCenterX
	askQuestionButton.y=(500)
	
	local askText=display.newText("Click here to Move On", 0,0,native.systemFontBold, 40)
	sceneGroup:insert(askText)
	askText.x=display.contentCenterX + 10
	askText.y=(500)
	
	function buttonClicked (event)
	
		function changeSceneDelayed (event)
			local options =
					{
						
						params = {
							myGroup = chimeraGroup
						}
					}
    		composer.gotoScene("completeScreen",options)
    	end
	
		
		timer.performWithDelay(500, changeSceneDelayed, options)
	end

	background1:toBack()
    background2:toBack()
    background3:toBack()

	askQuestionButton:addEventListener("touch", buttonClicked)
	
end



-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene