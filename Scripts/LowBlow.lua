local contador = 0
local messageToCheck = "Low Blow"

local vocationIds = {
    [Enums.Vocations.KNIGHT] = 23519,
    [Enums.Vocations.PALADIN] = 23519,
    [Enums.Vocations.SORCERER] = 23519,
    [Enums.Vocations.DRUID] = 23519
}

--Obtém a vocação do jogador
local creature = Creature(Player:getId())
local vocation = creature:getVocation()


function TextMessage(data)
    local hasMessage = string.match(data.text, messageToCheck) ~= nil
    if (hasMessage) then 
        contador = contador + 1
    end
end

local hudText = HUD.new(108, 610, "Low Blow: " .. contador)
hudText:setDraggable(true)
hudText:setColor(255, 255, 255) 


local hudTextPos = hudText:getPos()
local hudItem = HUD.new(hudTextPos.x , hudTextPos.y - 10, vocationIds[vocation])


local function updateHUD()
    hudText:setText("Low Blow: " .. contador)
    hudItem:setPos(hudText:getPos().x , hudText:getPos().y - 10)
end



Timer('hud_manipulation', updateHUD, 100)


function resetHud()
    contador = 0
end


hudItem:setCallback(resetHud)


Game.registerEvent(Game.Events.TEXT_MESSAGE, TextMessage)


