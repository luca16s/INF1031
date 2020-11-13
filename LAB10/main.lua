local mqttLove = require "mqttLoveLibrary"
local decodificador = require "decodificador"
local constantes = require "constantes"
local text = ''
math.randomseed(os.time())
local usuario = string.format("JOG-%d", math.random(0, 100))

local bolas = {}
local pontuacao = {}
local N = 100
local R = 50
local S = 0
local cores = {{0.4,1,0.4},
               {1,0.7,0.4},
               {0.6,0.6,0.6},
               {1,0.4,0.4},
               {0.3, 0, 0.6},
               {0.8, 0.2, 0.2},
               {0,0.2,0.4}}

local function removeDiscos(mensagem)
  local x, y = decodificador.decodificarCoordenadas(mensagem)
  for i = #bolas, 1, -1 do
    if math.sqrt((x-bolas[i].x)^2 + (y-bolas[i].y)^2) < bolas[i].r then
      mqttLove.changeChannel(constantes.canalPontuacao)
      mqttLove.sendMessage(string.format("<PONTO><%s><%f>", usuario, (pontuacao[usuario] + R / bolas[i].r)), constantes.canalPontuacao)
      table.remove(bolas, i)
      break
    end
  end
end

local function contabilizaPontos(mensagem)
  return Decodificador.decodificarPontuacao(mensagem)
end

local function trataMensagemRecebida(mensagem)
  local palavraChaveMensagem = decodificador.buscaPalavraChaveMensagem(mensagem)
  local mensagemTratada = string.sub(mensagem, string.len(palavraChaveMensagem) + 1)

  if palavraChaveMensagem == Constantes.NovoJogador then
  elseif palavraChaveMensagem == Constantes.SelecaoDiscos then
    removeDiscos(mensagemTratada)
  elseif palavraChaveMensagem == Constantes.Pontuacao then
    local jogador, pontos = contabilizaPontos(mensagemTratada)
    pontuacao[jogador] = pontos + pontuacao[jogador]
  end
end

function love.load()
  local w, h = love.graphics.getDimensions()
  math.randomseed(S)
  for i = 1, N do
    local r = math.random(R/10, R)
    local x = math.random(r, w-r)
    local y = math.random(r, h-r)
    local cor = cores[math.random(1, #cores)]
    table.insert(bolas, {r = r, x = x, y = y, cor = cor})
  end
  love.graphics.setBackgroundColor(1, 1, 1)
  local font = love.graphics.newFont(constantes.fonte, 24)
  text = love.graphics.newText(font, "")
  pontuacao[usuario] = 0
  mqttLove.start(constantes.host, usuario, constantes.canalLobby,  trataMensagemRecebida)
end

function love.update(dt)
  mqttLove.checkMessages()
end

function love.draw()
  for i = 1, #bolas do
    love.graphics.setColor(bolas[i].cor[1], bolas[i].cor[2], bolas[i].cor[3])
    love.graphics.circle("fill", bolas[i].x, bolas[i].y, bolas[i].r)
  end

  for chave, valor in pairs(pontuacao) do
    text:set(string.format(constantes.totalPontos, chave, valor))
    love.graphics.setColor(0, 0, 0)
    love.graphics.draw(text, 0, 0)
  end
end

function love.mousepressed (x, y)
  mqttLove.changeChannel(constantes.canalJogo)
  mqttLove.sendMessage(string.format(constantes.mensagem, x, y, usuario), constantes.canalJogo)
end

