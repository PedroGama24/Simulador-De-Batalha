local utils = require "utils"

local actions = {}

actions.list = {}


--- Cria uma lisa de ações que é armazenada internamente
function actions.build()
    -- Reset list
    actions.list = {}



    -- Atacar com o corpo
    local bodyAttack = {
        description = "Atacar com o corpo.",
        requirement = nil,
        execute = function(playerData, creatureData)
            -- 1. Definir chance de acerto
            local successChance = playerData.agility == 0 and 1 or creatureData.agility / playerData.agility
            local sucess = math.random() <= successChance

            -- 2. Calcular dano
            local rawDamage = creatureData.attack - math.random() * playerData.defense
            local damage = math.max(1, math.ceil(rawDamage))

            if sucess then
                -- 3. Aplicar o dano em caso de sucesso
                playerData.health = playerData.health - damage

                -- 4. Mostrar o resultado
                print(string.format("%s atacou o %s com sucesso, causando %d de dano.",creatureData.name, playerData.name, damage))
                local healthRate = math.floor((playerData.health / playerData.maxHealth) *10)
                print(string.format("%s: %s", playerData.name, utils.getProgressBar(healthRate)))

            else
                print(string.format("%s tentou o ataque mas errou o %s.",creatureData.name, playerData.name))
            end
        end
    }

    -- Atacar sonar
    local sonarAttack={
        description = "Atacar com sonar.",
        requirement = nil,
        execute = function(playerData, creatureData)
            -- Calcular dano
            local rawDamage = creatureData.attack - math.random() * playerData.defense
            local damage = math.max(1, math.ceil(rawDamage * 0.3))

            -- 3. Aplicar o dano
            playerData.health = playerData.health - damage

            -- 4. Mostrar o resultado
            print(string.format("%s usou um sonar no %s com sucesso, causando %d de dano.",creatureData.name, playerData.name, damage))
            local healthRate = math.floor((playerData.health / playerData.maxHealth) *10)
            print(string.format("%s: %s", playerData.name, utils.getProgressBar(healthRate)))
        end
    }

     -- Aguardar
     local waitAction={
        description = "Aguardar.",
        requirement = nil,
        execute = function(playerData, creatureData)
            -- 4. Mostrar o resultado
            print(string.format("%s decidiu esperar, e não fez nada nesse turnou.",creatureData.name))
        end
    }

    -- Populate list
    actions.list[#actions.list + 1] = bodyAttack
    actions.list[#actions.list + 1] = sonarAttack
    actions.list[#actions.list + 1] = waitAction
end

---Retorna uma lista de ações válidas para o jogador
---@param playerData table Definição do jogador
---@param creatureData table Definição da criatura
---@return table
function actions.getValidActions(playerData, creatureData)
    local validActions = {}
    for _, action in pairs(actions.list) do
        local requirement = action.requirement
        local isValid = requirement == nil or requirement(playerData, creatureData)
        if isValid then
            validActions[#validActions+1] = action
        end
    end
    return validActions
end

return actions