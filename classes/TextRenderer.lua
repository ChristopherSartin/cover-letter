require "classes/Renderer"

TextRenderer = {
	text = "Hello World",
	align = "center",
	width = 200,
	height = 100,
	color = {0, 0, 0, 1}
}
TextRenderer.__index = TextRenderer
setmetatable(TextRenderer, {__index = Renderer})

function TextRenderer:new()
	o = Renderer:new()
	local self = setmetatable(o, TextRenderer)
	return self
end

function TextRenderer:draw()
	love.graphics.setColor(self.color)
	
	love.graphics.printf(
		self.text, 
		self.x + (self.parent.x or 0),
		self.y + (self.parent.y or 0),
		self.width,
		self.align,
		self.r + (self.parent.r or 0),
		self.sx * (self.parent.sx or 1),
		self.sy * (self.parent.sy or 1),
		0.5 * self.width,
		0.5 * self.height
	)
	
	love.graphics.setColor(1, 1, 1, 1)
end

function TextRenderer:setText(text)
	self.text = text
end