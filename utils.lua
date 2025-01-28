local utils = {}

---
---Essa função habilita o UTF-8 no terminal.
---
function utils.enableUtf8()
    os.execute("chcp 65001")
end

---
---Essa função imprime o cabeçalho do jogo.
---
function utils.printHeader()
    print([[
====================================================
   |^^^|                             |^^^|                            
    }_{                               }_{
    }_{                               }_{
/|_/---\_|\                       /|_/---\_|\
I _|\_/|_ I                       I _|\_/|_ I
\| |   | |/                       \| |   | |/
   |   |                             |   |
   |   |                             |   |
   |   |                             |   |
   |   |                             |   |
   |   |                             |   |
   |   |                             |   |
   |   |                             |   |
   |   |                             |   |
   |   |                             |   |
   |   |                             |   |
   |   |                             |   |
   |   |                             |   |
   |   |                             |   |
   \   /                             \   /
    \ /                               \ /
     Y                                 Y
      --------------------------------------

             ⚔️  SIMULADOR DE BATALHA ⚔️

====================================================

      Você empunha sua espada e se prepara para lutar.
                  É hora de batalhar!
]])
    
end

---
---Calcula uma barra de progresso ASCII baseada em um atributo
---@param attribute number Número de 0 a 10
---@return string
---
function utils.getProgressBar(attribute)
    local fullChar = "▰"
    local emptyChar = "▱"

    local result = ""
    for i = 1, 10, 1 do
        result = result ..( i <= attribute and fullChar or emptyChar)
    end
    return result
end

---
---Faz o print das informação do mosntro
---@param creature table
---
function utils.printCreature(creature)

    --Calculate the health rate
    local healthRate = math.floor((creature.health / creature.maxHealth) *10)

    -- Cartão
    print("| "..creature.name)
    print("| ")
    print("| "..creature.description)
    print("| ")
    print("|  Atributos:")
    print("|        Vida:           "..utils.getProgressBar(healthRate))
    print("|        Ataque:         "..utils.getProgressBar(creature.attack))
    print("|        Defesa:         "..utils.getProgressBar(creature.defense))
    print("|        Velocidade:     "..utils.getProgressBar(creature.agility))
end

---
function utils.printPlayer(player)

    --Calculate the health rate
    local healthRate = math.floor((player.health / player.maxHealth) *10)

    -- Cartão
    print("| "..player.name)
    print("| ")
    print("| "..player.description)
    print("| ")
    print("|  Atributos:")
    print("|        Vida:           "..utils.getProgressBar(healthRate))
    print("|        Ataque:         "..utils.getProgressBar(player.attack))
    print("|        Defesa:         "..utils.getProgressBar(player.defense))
    print("|        Velocidade:     "..utils.getProgressBar(player.agility))
end

---Pergunta para o jogador o numero que deseja, é retornado pela função
---@return any
function utils.ask()
    io.write("> ")
    local answer = io.read("*n")
    return answer
end

---
---Perguntar para o jogador qual e o nome e a descrição do personagem
---@param player table
function utils.setPlayerInfo(player)
    print("Qual é o nome do seu personagem?")
    io.write("> ")
    player.name = io.read()
    print("Descreva seu personagem:")
    io.write("> ")
    player.description = io.read()
end


function utils.distributePoints(player)
    local totalPoints = 15
    local maxHealth = 10

    print(string.format("%s tem %d pontos para distribuir.", player.name, totalPoints))
    print("O valor máximo para health é 10.")

    while totalPoints > 0 do
        print(string.format("Pontos restantes: %d", totalPoints))
        print("Digite a quatidade de pontos para health:")
        local healthPoints = utils.ask()
        if healthPoints > maxHealth then
            print("O valor máximo para health é 10.")
        elseif healthPoints > totalPoints then
            print("Você não tem pontos suficientes.")
        else
            player.health = healthPoints
            player.maxHealth = healthPoints
            totalPoints = totalPoints - healthPoints
            break
        end
    end

    local attributes = {"attack", "defense", "agility"}
    for _, attribute in pairs(attributes) do
        while totalPoints > 0 do
            print(string.format("Pontos restantes: %d", totalPoints))
            print(string.format("Digite a quatidade de pontos para %s:", attribute))
            local points = utils.ask()
            if points > totalPoints then
                print("Você não tem pontos suficientes.")
            else
                player[attribute] = points
                totalPoints = totalPoints - points
                break
            end
        end
    end
end

return utils


