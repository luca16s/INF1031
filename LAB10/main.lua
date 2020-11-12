local mqttLove = require "mqttLoveLibrary"
local decodificador = require "decodificador"
local constantes = require "constantes"
local usuario = 'luca16s'
local text = ''

local bolas = {}
local pontos = 0
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
  if string.match(mensagem, "<SEL>") == "<SEL>" then
    for i = #bolas, 1, -1 do
      if math.sqrt((x-bolas[i].x)^2 + (y-bolas[i].y)^2) < bolas[i].r then
        mqttLove.changeChannel(constantes.canalPontuacao)
        mqttLove.sendMessage(string.format("<PONTO><%s><%f>", usuario, (pontos + R / bolas[i].r)), constantes.canalPontuacao)
        table.remove(bolas, i)
        break
      end
    end
  end
end

local function contabilizaPontos(mensagem)
  love.window.showMessageBox("Teste", mensagem)
  local jogador, pontuacao = Decodificador.decodificarPontuacao(mensagem)
  love.window.showMessageBox("Teste", jogador)
  love.window.showMessageBox("Teste", pontuacao)
  return pontuacao
end

local function trataMensagemRecebida(mensagem)
  if decodificador.buscaPalavraChaveMensagem(mensagem) == '<SEL>' then
    removeDiscos(mensagem)
  elseif decodificador.buscaPalavraChaveMensagem(mensagem) == '<NOVOJOG>' then

  elseif decodificador.buscaPalavraChaveMensagem(mensagem) == '<PONTO>' then
    pontos = contabilizaPontos(string.sub(mensagem, string.len('<PONTO>') + 1))
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

  text:set(string.format(constantes.totalPontos, usuario, pontos))
  love.graphics.setColor(0, 0, 0)
  love.graphics.draw(text, 0, 0)
end

function love.mousepressed (x, y)
  mqttLove.changeChannel(constantes.canalJogo)
  mqttLove.sendMessage(string.format(constantes.mensagem, x, y, usuario), constantes.canalJogo)
end

