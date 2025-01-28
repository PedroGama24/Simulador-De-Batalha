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

---Pergunta para o jogador o numero que deseja, é retornado pela função
---@return any
function utils.ask()
    io.write("> ")
    local answer = io.read("*n")
    return answer
end

return utils