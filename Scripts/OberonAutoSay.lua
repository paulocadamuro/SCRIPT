local responses = {
    ["The world will suffer for its iddle laziness!"] = "Are you ever going to fight or do you prefer talking!",
    ["You appear like a worm among men!"] = "How appropriate, you look like something worms already got the better of!",
    ["People fall at my feet when they see me coming!"] = "Even before they smell your breath?",
    ["This will be the end of mortal man!"] = "Then let me show you the concept of mortality before it!",
    ["I will remove you from this plane of existence!"] = "Too bad you barely exist at all!",
    ["Dragons will soon rule this world, I am their herald!"] = "Excuse me but I still do not get the message!",
    ["The true virtue of chivalry are my belief!"] = "Dare strike up a Minnesang and you will receive your last accolade!",
    ["I lead the most honourable and formidable following of knights!"] = "Then why are we fighting alone right now?",
    ["ULTAH SALID'AR, ESDO LO!"] = "SEHWO ASIMO, TOLIDO ESD!"
}

function onTalk(authorName, authorLevel, type, x, y, z, text)
    if authorName == "Grand Master Oberon" and type == 36 then
        local response = responses[text]
        if response then
            Game.talk(response, 1)
        end
    end
end

Game.registerEvent(Game.Events.TALK, onTalk)