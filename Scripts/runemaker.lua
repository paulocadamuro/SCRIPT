local runeToMake = "Adori mas frigo" -- runa a ser feita
local soulCost = 3 -- quantidade de soul que custa para fazer a runa
local spellToTraining = "Utevo Vis Lux" -- spell a ser treinada


local runeTimer
local spellTimer

runeTimer = Timer("soul", function () 
    if not clientIsConnected() then return end

    if playerGetSoulPoints() >= soulCost then
        gameTalk(runeToMake, Enums.TalkTypes.TALKTYPE_SAY)
    else
        runeTimer:stop()
        spellTimer:start()
    end
end, 2100)


spellTimer = Timer("spell", function () 
    if not clientIsConnected() then return end

    if playerGetSoulPoints() < soulCost then
        gameTalk(spellToTraining, Enums.TalkTypes.TALKTYPE_SAY)
    else
        spellTimer:stop()
        runeTimer:start()
    end
end, 1000)

spellTimer:stop()