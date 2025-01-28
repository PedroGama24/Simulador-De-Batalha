--[[
==========================================
Você empunha sua espada e se prepara para lutar.
É hora de batalhar!

|   Prismarine Colossus
|
|   Enormes estátuas de prismarina se erguem diante de você. Sua aparencia ameçadora pode assutar até os mais bravos guerreiros.
|   Eles têm olhos turquesa brillhantes, mas um elogio não vai te ajudar a sobreviver. 
|
|
|   Atributos:
|   Vida       ▰▰▰▰▰▰▰▰▰▰
|   Ataque     ▰▰▰▱▱▱▱▱▱▱
|   Defesa     ▰▰▰▰▰▰▰▰▰▰  
|   Agilidade  ▰▱▱▱▱▱▱▱▱▱
|
|   
|
|   Oque você deseja fazer?
|   1. Atacar com a espada.
|   2. Usar poção de regeneração.
|   3. Atirar uma pedra.
|   4. Se esconder.
    >
]]

-- Dependências
local player = require("player.player")
local playerActions = require("player.actions")
local colossus = require("colossus.colossus")
local utils = require("utils")

-- Habilite o UTF-8
utils.enableUtf8()

--Header
utils.printHeader()

-- Obter definição do jogador

-- Obter definição do mosntro
local boss = colossus

-- Apresentar o monstro
utils.printCreature(boss)

-- Build the player
playerActions.build()

-- Começar o loop de batalha
while true do
    -- Mostrar ações disponíveis
    print()
    print("O que você deseja fazer?")
    local validPlayerActions = playerActions.getValidActions(player, boss)
    for i, actions in pairs(validPlayerActions) do
        print(string.format("%d. %s", i, actions.description))
    end
    local chosenIndex = utils.ask()
    local chosenAction = validPlayerActions[chosenIndex]
    local isActionValid = chosenAction ~= nil

    -- Simular o turno do jogador
    if isActionValid then
        chosenAction.execute(player, boss)
    else
        print("Você não pode fazer isso agora.")
    end

    --Ponto de saida: Criatura ficou sem vida
    if boss.health <= 0 then
        break
    end

    -- Simular o turno da criatura

    -- Ponto de saida: Jogador morreu
    if player.health <= 0 then
        break    
    end
end


-- Fim do jogo