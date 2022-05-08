require "classes/Dialogue"
require "TextButtonList"
require "Helper"

dialogue = {
	--Intro
	intro = Dialogue:new(
		"Hi, It's nice to meet you! My name is Christopher Sartin. Here is my application for full time game engineer at Filament Games!", 
		"sprites/neut.png", 
		{
			Choice:new("Uh... what is this?", 
			function(avatar, text)
				setDialogue("intro_weird", avatar, text)
			end
			),
			Choice:new("Nice to meet you!", 
			function(avatar, text)
				setDialogue("intro_code", avatar, text)
			end
			)
		}
	),
	intro_code = Dialogue:new(
		"I know this is probably a strange introduction, but I thought it would be a little more interesting than a cover letter. Also a fun reason to do some code.",
		"sprites/expl.png",
		{
			Choice:new("How did you make this?", 
			function(avatar, text)
				setDialogue("lua", avatar, text)
			end
			)
		}
	),
	intro_weird = Dialogue:new(
		"I guess this is a kinda weird \"cover letter\". I just thought it would be more fun than having you read a boring paragraph.",
		"sprites/smug.png",
		{
			Choice:new("Actually, I happen to like \"boring paragraphs\"", 
			function(avatar, text)
				setDialogue("intro_too_long", avatar, text)
			end
			),
			Choice:new("That's fair! So how does this work?", 
			function(avatar, text)
				setDialogue("lua", avatar, text)
			end
			)
		}
	),
	intro_too_long = Dialogue:new(
		"Okay, okay... I really hadn't intended you to stay on this thread so long. How about you ask me about something else.",
		"sprites/worr.png",
		{
			Choice:new("I guess you're gonna make me ask about Lua...", 
			function(avatar, text)
				setDialogue("lua", avatar, text)
			end
			),
			Choice:new("Have you made any games with Lua?", 
			function(avatar, text)
				setDialogue("lua", avatar, text)
			end
			),
			Choice:new("Can you talk about your Lua experience?", 
			function(avatar, text)
				setDialogue("lua", avatar, text)
			end
			)
		}
	),
	
	--Lua
	lua = Dialogue:new(
		"Well, I knew you perfered some Lua experience so in arround 20 hours I learned Lua and wrote this game! I really wanted to feel arround some of the software we might be using together!",
		"sprites/conf.png",
		{
			Choice:new("HOLY CRAP THAT'S AWESOME!!", 
			function(avatar, text)
				setDialogue("lua_leading", avatar, text)
			end
			)
		}
	),
	lua_leading = Dialogue:new(
		"I thought you would say that (I mean it was your only text option so I guess that was cheating)! I am rather proud though! I got to try my hand in some object oriented Lua. I also did all the art!",
		"sprites/smug.png",
		{
			Choice:new("What other experience do you have?", 
			function(avatar, text)
				setDialogue("experience", avatar, text)
			end
			)
		}
	),
	
	--Experience
	experience = Dialogue:new(
		"What would you like to learn about?",
		"sprites/neut.png",
		{
			Choice:new("Other Experience", 
			function(avatar, text)
				setDialogue("other", avatar, text)
			end
			),
			Choice:new("Can you tell me about some projects you've helpped create?", 
			function(avatar, text)
				setDialogue("projects", avatar, text)
			end
			),
			Choice:new("Tell me about your Unity Experience.", 
			function(avatar, text)
				setDialogue("unity", avatar, text)
			end
			),
		}
	),
	unity = Dialogue:new(
		"I've been working with the Unity 3D game engine for about 3 years professionally. I've worked on both 2D and 3D applications and have recently done some more experimental work!",
		"sprites/expl.png",
		{
			Choice:new("Experimental work?", 
			function(avatar, text)
				setDialogue("unity_machine_learning", avatar, text)
			end
			),
		}
	),
	unity_machine_learning = Dialogue:new(
		"I've starting doing some machine learning tasks! I've been asked to help develop a augmented reality object tracker prototype. We want to track 3D spaces to provide engaging experiences for guests!",
		"sprites/conf.png",
		{
			Choice:new("That's cool! let's talk about something else.", 
			function(avatar, text)
				for i, choice in pairs(dialogue["experience"].choices) do
					if choice.text == "Tell me about your Unity Experience." then
						table.remove(dialogue["experience"].choices, i)
						break
					end
				end
				
				if tablelength(dialogue["experience"].choices) <= 0 then
					setDialogue("outro", avatar, text)
				else
					setDialogue("experience", avatar, text)
				end
			end
			),
		}
	),
	
	projects = Dialogue:new(
		"I've been creating interactive kiosks for museum of the Bible for about 3 years now. These are usually touch applications that teach patrons about the different exhibits in our museum!",
		"sprites/conf.png",
		{
			Choice:new("Ooooh, neat! Can I see them?", 
			function(avatar, text)
				setDialogue("projects_in", avatar, text)
			end
			)
		}
	),
	projects_in = Dialogue:new(
		"You can! You can view quite a few projects we've developed at my linked in page: https://www.linkedin.com/in/christopher-sartin \n A clickable link will be in my resume.",
		"sprites/expl.png",
		{
			Choice:new("That's cool! let's talk about something else.", 
			function(avatar, text)
				for i, choice in pairs(dialogue["experience"].choices) do
					if choice.text == "Can you tell me about some projects you've helpped create?" then
						table.remove(dialogue["experience"].choices, i)
						break
					end
				end
				
				if tablelength(dialogue["experience"].choices) <= 0 then
					setDialogue("outro", avatar, text)
				else
					setDialogue("experience", avatar, text)
				end
			end
			)
		}
	),
	
	other = Dialogue:new(
		"Ooooh! This one is fun! Due to limited staff resources at my current employer, I've actually got to fill many roles, including UX/UI design, Project Management, and web development.",
		"sprites/smug.png",
		{
			Choice:new("What web design have you done?", 
			function(avatar, text)
				setDialogue("web", avatar, text)
			end
			),
			Choice:new("What did project managment entail?", 
			function(avatar, text)
				setDialogue("management", avatar, text)
			end
			),
			Choice:new("UX/UI?", 
			function(avatar, text)
				setDialogue("ux", avatar, text)
			end
			),
		}
	),
	web = Dialogue:new(
		"I've been devloping web pages using the Laravel framework! Durring my experience, I've had to learn plain JS, Livewire, and Vue. I've also made some apps using electron! It's been fun learning so much!",
		"sprites/conf.png",
		{
			Choice:new("Cool, let's talk about the other two.", 
			function(avatar, text)
				setDialogue("other_mad", avatar, text)
			end
			)
		}
	),
	management = Dialogue:new(
		"I'm a fairly natural people person, so both of my previous software employers asked me to communicate with stakeholders and develop project requirements. At my current employer I oversaw all requirements on a project from cradle to grave.",
		"sprites/neut.png",
		{
			Choice:new("Cool, let's talk about the other two.", 
			function(avatar, text)
				setDialogue("other_mad", avatar, text)
			end
			)
		}
	),
	ux = Dialogue:new(
		"I've actually desinged the UX for two different projects! One was a interactive touchscreen for an exhibit we had called Tapestry of light. The other was a kids game we developed called Comming to America. I'd love to show you sometime!",
		"sprites/expl.png",
		{
			Choice:new("Cool, let's talk about the other two.", 
			function(avatar, text)
				setDialogue("other_mad", avatar, text)
			end
			)
		}
	),
	
	other_mad = Dialogue:new(
		"How about we talk about that later?",
		"sprites/smug.png",
		{
			Choice:new("WHAT?! BUT I WANNA KNOW MORE!!", 
			function(avatar, text)
				setDialogue("other_end", avatar, text)
			end
			)
		}
	),
	
	other_end = Dialogue:new(
		"Well you can! If you wanna know more you should invite me to a real interview!",
		"sprites/worr.png",
		{
			Choice:new("Okay... let's talk about something else.", 
			function(avatar, text)
				for i, choice in pairs(dialogue["experience"].choices) do
					if choice.text == "Other Experience" then
						table.remove(dialogue["experience"].choices, i)
						break
					end
				end
				
				if tablelength(dialogue["experience"].choices) <= 0 then
					setDialogue("outro", avatar, text)
				else
					setDialogue("experience", avatar, text)
				end
			end
			)
		}
	),
	outro = Dialogue:new(
		"I would love to talk about lots of things! But I think it'd be best to continue face to face! If you want to know more check out my resume and give me a call! Thanks so much for playing this short game!",
		"sprites/neut.png",
		{
			Choice:new("How can I contact you?", 
			function(avatar, text)
				setDialogue("ending", avatar, text)
				textBox:destroy()
				background = love.graphics.newImage("sprites/end.png")
			end
			)
		}
	),
	ending = Dialogue:new(
		"",
		"sprites/neut.png",
		{
			Choice:new("EXIT", 
			function(avatar, text)
				love.event.quit( 0 )
			end
			)
		}
	)
}

dialogueIndex = "intro"

function setDialogue(index, characterGameObject, textDisplay)
	dialogueIndex = index
	textDisplay:setText(dialogue[index].text)
	characterGameObject:setImage(dialogue[index].spriteName)
	
	renderList()
end

function getCurrentDialogue()
	return dialogue[dialogueIndex]
end