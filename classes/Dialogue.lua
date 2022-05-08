--Dialogue Class
Dialogue = {
	text = "Hello World",
	spriteName = "test.png",
	choices = {}
}
Dialogue.__index = Dialogue

function Dialogue:new(text, spriteName, choices)
	o = {}
	local self = setmetatable(o, Dialogue)
	self.text = text
	self.spriteName = spriteName
	self.choices = choices
	return self
end


--Choice Class
Choice = {
	text = "",
	func = function() end
}
Choice.__index = Choice

function Choice:new(text, func)
	o = {}
	local self = setmetatable(o, Choice)
	self.text = text
	self.func = func
	return self
end
