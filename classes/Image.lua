-- Image Class Attributes
Image = { sprite = nil, ox = 0, oy = 0 }
Image.__index = Image

-- Image Class Constructor 
function Image:new(spriteName, ox, oy)
	o = {}
	local self = setmetatable(o, Image)
	self.sprite = love.graphics.newImage(spriteName)
	self.ox = self.sprite:getWidth() * (ox or 0)
	self.oy = self.sprite:getHeight() * (oy or 0)
	return self
end