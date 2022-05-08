require "classes/Transform"

Renderer = {}
Renderer.__index = Renderer
setmetatable(Renderer, {__index = Transform})

renderers = {}

function Renderer:new()
	o = Transform:new()
	local self = setmetatable(o, Renderer)
	table.insert(renderers, self)
	return self
end

function Renderer:draw() end

function Renderer:destroy()	
	parent = nil
	
	local index
	for i=#renderers,1,-1 do
   		if renderers[i].uuid == self.uuid then
	   		index = i
	   		break
   		end
	end
		
	table.remove(renderers, index)
	
	for i=#renderers,1,-1 do
		   if renderers[i].parent.uuid == self.uuid then
			   renderers[i]:destroy()
		   end
	end	
end