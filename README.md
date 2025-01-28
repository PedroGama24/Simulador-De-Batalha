# Simulador de Batalha ⚔️

Bem-vindo ao **Simulador de Batalha**! Este é um jogo onde você enfrenta um monstro colossal e tenta derrotá-lo usando suas habilidades e estratégias. Prepare-se para uma batalha épica!

## Introdução

Neste simulador, você assume o papel de um guerreiro corajoso que deve enfrentar um monstro poderoso. Você terá a oportunidade de personalizar seu personagem, distribuir pontos de atributos e escolher suas ações durante a batalha.

## Como Jogar

### Passo 1: Configuração do Personagem

1. **Nome e Descrição**: Escolha um nome e uma descrição para o seu personagem.
2. **Distribuição de Pontos**: Você tem 15 pontos para distribuir entre os seguintes atributos:
   - **Vida (Health)**: Máximo de 10 pontos.
   - **Ataque (Attack)**
   - **Defesa (Defense)**
   - **Agilidade (Agility)**

### Passo 2: Enfrentando o Monstro

O monstro que você enfrentará é o **Prismarine Colossus**. Ele possui os seguintes atributos:
- **Vida**: 20
- **Ataque**: 4
- **Defesa**: 10
- **Agilidade**: 2

### Passo 3: Ações Disponíveis

Durante a batalha, você pode escolher entre as seguintes ações:
1. **Atacar com a espada**: Tente causar dano ao monstro.
2. **Usar poção de regeneração**: Recupere parte da sua vida (se tiver poções disponíveis).
3. **Atirar uma pedra**: Uma ação alternativa para causar dano.
4. **Se esconder**: Tente evitar o ataque do monstro.

### Passo 4: Condições de Vitória e Derrota

- **Vitória**: Você vence se a vida do monstro chegar a zero.
- **Derrota**: Você perde se a sua vida chegar a zero.


## Requisitos

- **Lua 5.4.2** ou superior

## Como Executar

1. Clone o repositório:
   ```sh
   git clone https://github.com/PedroGama24/Simulador-De-Batalha
2. Navegue até o diretório do projeto:
    ```sh
    cd Simulador-De-Batalha
3.Execute o jogo:
    ```sh
    lua main.lua

## Contribuição
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests para melhorar o jogo.

## Licença
Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

Divirta-se jogando e boa sorte na batalha! 🎮⚔️

## Exemplo de Jogo

```plaintext
Digite o nome do seu personagem:
> Violet
Digite a descrição do seu personagem:
> Uma guerreira corajosa e destemida.

Você tem 15 pontos para distribuir entre os seguintes atributos: health, attack, defense, agility.
O valor máximo para health é 10.
Pontos restantes: 15
Digite a quantidade de pontos para health:
> 10
Pontos restantes: 5
Digite a quantidade de pontos para attack:
> 3
Pontos restantes: 2
Digite a quantidade de pontos para defense:
> 1
Pontos restantes: 1
Digite a quantidade de pontos para agility:
> 1

Qual será a próxima ação de Violet?
1. Atacar com a espada.
2. Usar poção de regeneração.
> 1
Violet atacou o Prismarine Colossus com sucesso, causando 3 de dano.