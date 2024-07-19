function onTalk(authorName, authorLevel, type, x, y, z, text)
        if text == "SWAARP" then
            Game.talk("utamo vita", 1)

       end
end

Game.registerEvent(Game.Events.TALK, onTalk)
