require "classes/Image"
require "classes/Renderer"

Gameobject = {
	image = {},
	colIndex = nil,
	onclick = function() end,
}
Gameobject.__index = Gameobject
setmetatable(Gameobject, {__index = Renderer})

colliders = {}

function Gameobject:new(image)
	o = Renderer:new()
	local self = setmetatable(o, Gameobject)
	self.image = image
	table.insert(colliders, self)
	return self
end

function Gameobject:draw()		
	love.graphics.draw(
		self.image.sprite,
		self.x + (self.parent.x or 0),
		self.y + (self.parent.y or 0),
		self.r + (self.parent.r or 0),
		self.sx * (self.parent.sx or 1),
		self.sy * (self.parent.sy or 1),
		self.image.ox,
		self.image.oy
	)
end

function Gameobject:setImage(spriteName)
	self.image.sprite = love.graphics.newImage(spriteName)
end

function Gameobject:destroy()
	local index
	for i=#colliders,1,-1 do
	   if colliders[i].uuid == self.uuid then
		   index = i
		   break
	   end
	end
		
	table.remove(colliders, index)
	Renderer.destroy(self)
end

function Gameobject:checkCollision(x, y)
	local width = self.image.sprite:getWidth()
	local height = self.image.sprite:getHeight()
	
	local left = self.x - self.image.ox
	local top = self.y - self.image.oy
	
	if left <= x and x <= (left + width) and top <= y and y <= (top + height) then
		return true
	end
	
	return false
end