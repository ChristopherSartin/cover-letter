function makeTextButton(x, y, text, func, spriteName)
	local sprite = spriteName or "sprites/dialogue-box.png"
	go = Gameobject:new(Image:new(sprite, .5, .5))
	go.onclick = func
	go:setPosition(x, y)
	
	to = TextRenderer:new()
	to:setParent(go)
	to:setPosition(0, 0)
	to.height = 25
	to.alignment = "center"
	to:setText(text)
	
	return go
end