require "classes/Gameobject"

textButtonList = {}
padding = 125--px


function renderList()	
	for _,go in pairs(textButtonList) do
    	go:destroy()
	end
	
	textButtonList = {}
	
	for i, choice in pairs(getCurrentDialogue().choices) do
		go = makeTextButton(0 + 175,(love.graphics.getHeight() - 75) - ((i - 1) * padding), choice.text, choice.func)
		table.insert(textButtonList, go)
	end
end