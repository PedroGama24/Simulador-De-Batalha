local utils = require "utils"

local actions = {}

actions.list = {}


--- Cria uma lisa de ações que é armazenada internamente
function actions.build()
    -- Reset list
    actions.list = {}

    -- Atacar com a espada
    local swordAttack = {
        description = "Atacar com a espada.",
        requeirement = nil,
        execute = function(playerData, creatureData)
            -- 1. Definir chance de acerto
            local successChance = creatureData.agility == 0 and 1 or playerData.agility / creatureData.agility
            local sucess = math.random() <= successChance

            -- 2. Calcular dano
            local rawDamage = playerData.attack - math.random() * creatureData.defense
            local damage = math.max(1, math.ceil(rawDamage))

            if sucess then
                -- 3. Aplicar o dano em caso de sucesso
                creatureData.health = creatureData.health - damage

                -- 4. Mostrar o resultado
                print(string.format("%s atacou o %s com sucesso, causando %d de dano.", playerData.name, creatureData.name, damage))
                local healthRate = math.floor((creatureData.health / creatureData.maxHealth) *10)
                print(string.format("%s: %s", creatureData.name, utils.getProgressBar(healthRate)))

            else
                print(string.format("%s tentou o ataque mas esqueceu a espada contra o %s.", playerData.name, creatureData.name))
            end
        end
    }

    -- Usar poção de regeneração
    local regenPotion = {
        description = "Usar poção de regeneração.",
        requirement = function (playerData, creatureData)
            return playerData.potions >= 1
        end,
        execute = function (playerData, creatureData)
            -- 1. Tirar poção do inventário
            playerData.potions = playerData.potions - 1

            -- 2. Recuperar vida
            local regenPotions = 5
            playerData.health = math.min(playerData.maxHealth, playerData.health + regenPotions)
            print(string.format("%s recuperou %d de vida.", playerData.name, regenPotions))
        end
    }

    -- Populate list
    actions.list[#actions.list + 1] = swordAttack
    actions.list[#actions.list + 1] = regenPotion
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