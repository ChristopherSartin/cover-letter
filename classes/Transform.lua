Transform = {
	x = 0,
	y = 0,
	r = 0,
	sx = 1,
	sy = 1,
	parent = {},
	uuid = nil
}
Transform.__index = Transform

uuid = 0

function Transform:new()
	o = {}
	local self = setmetatable(o, Transform)
	uuid = uuid + 1
	self.uuid = uuid
	return self
end

function Transform:setPosition(x, y)
	self.x = x
	self.y = y
end

function Transform:move(x, y)
	self.x = self.x + x
	self.y = self.y + y
end

function Transform:setRotation(r)
	self.r = r % (2 * math.pi)
end
	
function Transform:rotate(r)
	self.r = self.r + r
end
	
function Transform:setScale(x, y)
	self.sx = x
	self.sy = y
end

function Transform:setParent(transform)
	self.parent = transform
end