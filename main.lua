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
local utils = require("utils")
local player = require("player.player")
local playerActions = require("player.actions")
local colossus = require("colossus.colossus")
local colossusActions = require("colossus.actions")

-- Habilite o UTF-8
utils.enableUtf8()

--Header
utils.printHeader()

-- Obter definição do jogador

-- Obter definição do mosntro
local boss = colossus
local bossActions = colossusActions

-- Apresentar o monstro
utils.printCreature(boss)

-- Build the player
playerActions.build()
bossActions.build()

-- Começar o loop de batalha
while true do
    -- Mostrar ações disponíveis
    print()
    print(string.format("Qual será a próxima ação de %s?", player.name))
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
        print(string.format("Sua ação nao e valida. %s perdeu a vez.", player.name))
    end

    --Ponto de saida: Criatura ficou sem vida
    if boss.health <= 0 then
        break
    end

    -- Simular o turno da criatura
    print()
    local validBossActions = bossActions.getValidActions(player, boss)
    local bossAction = validBossActions[math.random(#validBossActions)]
    bossAction.execute(player, boss)

    -- Ponto de saida: Jogador morreu
    if player.health <= 0 then
        break    
    end
end

-- Processar condição de Vitoria e Derrota
    if player.health <= 0 then
        print()
        print("----------------------------------------------------")
        print()
        print("💀💀")
        print(string.format("%s foi derrotado por %s.",player.name, boss.name))
        print("Quem sabe na próxima vez você será mais forte.")
        print()
    elseif boss.health <= 0 then
        print()
        print("----------------------------------------------------")
        print()
        print("🎉🎉")
        print(string.format("%s prevaleceu e venceu o %s",player.name, boss.name))
        print("Você é um verdadeiro herói!")
        print()

    end