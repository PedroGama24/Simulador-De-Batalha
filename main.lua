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
local player = require("definitions.player")
local colossus = require("definitions.colossus")
local utils = require("utils")

-- Habilite o UTF-8
utils.enableUtf8()

--Header
utils.printHeader()

-- Obter definição do jogador

-- Obter definição do mosntro
local boss = colossus

-- Apresentar o mosntro
utils.printCreature(boss)

-- Começar o loop de batalha