-- Estrutura para armazenar os valores anteriores das habilidades
previousSkillValues = {}
hours, mins, secs = 0

-- Tabela para armazenar os tempos estimados como strings
estimatedTimeStrings = {
    fistPercent = "Indefinido",
    axePercent = "Indefinido",
    clubPercent = "Indefinido",
    swordPercent = "Indefinido",
    distancePercent = "Indefinido",
    shieldPercent = "Indefinido",
    fishingPercent = "Indefinido",
    magicPercent = "Indefinido"
}

function testeskill()
    local skill = Player.getSkills()
    local currentTime = os.time()

    -- Inicializa a string de habilidades para o HUD
    local skillsText = "Magic: %s\nFist: %s\nClub: %s\nSword: %s\nAxe: %s\nDistance: %s\nShield: %s"

    if next(previousSkillValues) == nil then
        for k, v in pairs(skill) do
            previousSkillValues[k] = {value = v, timestamp = currentTime}
            -- Inicializa os tempos estimados como "Indefinido" para cada habilidade
            estimatedTimeStrings[k] = "Indefinido"
        end
    else
        for k, v in pairs(skill) do
            local previousValue = previousSkillValues[k].value
            local previousTime = previousSkillValues[k].timestamp
            
            if v ~= previousValue then
                local deltaTime = currentTime - previousTime
                local deltaValue = v - previousValue
                local ratePerSecond = deltaValue / deltaTime
                
                local remaining = 100 - v
                local estimatedSeconds = remaining / ratePerSecond
                
                if estimatedSeconds >= 0 then
                    hours = math.floor(estimatedSeconds / 3600)
                    mins = math.floor((estimatedSeconds % 3600) / 60)
                    secs = math.floor(estimatedSeconds % 60)
                    estimatedTimeStrings[k] = string.format("%d horas, %d minutos e %d segundos", hours, mins, secs)
                else
                    estimatedTimeStrings[k] = "Indefinido"
                end

                -- Atualiza o valor e o carimbo de tempo anteriores
                previousSkillValues[k] = {value = v, timestamp = currentTime}
            end
        end
    end

    -- Monta a string com todas as informações atualizadas
    local hudText = string.format(skillsText, 
                                  estimatedTimeStrings["magicPercent"], 
                                  estimatedTimeStrings["fistPercent"], 
                                  estimatedTimeStrings["clubPercent"], 
                                  estimatedTimeStrings["swordPercent"], 
                                  estimatedTimeStrings["axePercent"], 
                                  estimatedTimeStrings["distancePercent"], 
                                  estimatedTimeStrings["shieldPercent"])

    -- Atualiza o HUD com a nova string contendo todas as informações
    hudTextSetText(hudIdMagic, hudText)
end

-- Inicializa o timer
Timer("testedeskill", testeskill, 10000)


hudIdMagic = hudTextCreate()
hudSetPos(hudIdMagic, 180, 215)
hudTextSetColor(hudIdMagic, 255, 255, 255)
hudSetDraggable(hudIdMagic, true)

hudTextSetText(hudIdMagic, "Magic: Indefinido\n Fist: Indefinido\nClub: Indefinido\nSword: Indefinido\nAxe: Indefinido\nDistance: Indefinido\nShield: Indefinido")