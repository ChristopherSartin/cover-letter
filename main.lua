require "classes/Gameobject"
require "classes/TextRenderer"
require "DialogueManager"
require "prefabs/TextButtonGameobject"

function love.load()
	background = love.graphics.newImage("sprites/background.jpg")
	
	avatar = Gameobject:new(Image:new("sprites/neut.png", 1, 1))
	avatar:setScale(.7, .7)
	avatar:setPosition(love.graphics.getWidth(), love.graphics.getHeight())
	
	textBox = Gameobject:new(Image:new("sprites/text-box.png", .5, .5))
	textBox:rotate(-.02)
	textBox:setPosition(love.graphics.getWidth() - 225, love.graphics.getHeight() - 425)

	text = TextRenderer:new()
	text.width = 255
	text.text = love.graphics.getWidth() .. " x " .. love.graphics.getHeight()
	text:setPosition(0, -30)
	text:setParent(textBox)
	
	font = love.graphics.newFont("font/kalam.ttf", 13)
	love.graphics.setFont(font)
	
	setDialogue(dialogueIndex, avatar, text)
		
end

function love.update(dt)
end

function love.draw()
	love.graphics.draw(background)
		
	for i, renderer in ipairs(renderers) do
		renderer:draw()
	end
	
	
end

function love.mousepressed(x, y, button, istouch, presses)
	if button == 1 then
		for i, collider in pairs(colliders) do
			if collider:checkCollision(x, y) then
				collider.onclick(avatar, text)
				return
			end
		end
	end
end

