local mqttLove = require "mqttLoveLibrary"
local decodificador = require "decodificador"
local constantes = require "constantes"
local text = ''
math.randomseed(os.time())
local idJogador = string.format("JOG-%d", math.random(0, 100))

local bolas = {}
local pontuacao = {}
local N = 100
local R = 50
local semente = nil
local cores = {{0.4,1,0.4},
               {1,0.7,0.4},
               {0.6,0.6,0.6},
               {1,0.4,0.4},
               {0.3, 0, 0.6},
               {0.8, 0.2, 0.2},
               {0,0.2,0.4}}

local function inicializaDadosJogador(mensagem)
    local jogador = Decodificador.dadosJogador(mensagem)
    if jogador ~= idJogador then
      pontuacao[jogador] = 0
      math.randomseed(os.time())
      mqttLove.sendMessage(string.format('%s<%f>', Constantes.Semente, math.random()), Constantes.canalLobby);
    end
end

local function removeDiscos(mensagem)
  local x, y, jogador = decodificador.decodificarCoordenadas(mensagem)
  for i = #bolas, 1, -1 do
    if math.sqrt((x-bolas[i].x)^2 + (y-bolas[i].y)^2) < bolas[i].r then
      if jogador == idJogador then
        mqttLove.changeChannel(constantes.canalPontuacao)
        mqttLove.sendMessage(string.format("%s<%s><%f>", Constantes.Pontuacao, idJogador, (pontuacao[idJogador] + R / bolas[i].r)), constantes.canalPontuacao)
      end
      table.remove(bolas, i)
      break
    end
  end
end

local function contabilizaPontos(mensagem)
  local jogador, pontos = Decodificador.decodificarPontuacao(mensagem)
  pontuacao[jogador] = pontos + (pontuacao[jogador] or 0)
  mqttLove.changeChannel(constantes.canalJogo)
end

local function trataMensagemRecebida(mensagem)
  local palavraChaveMensagem = decodificador.buscaPalavraChaveMensagem(mensagem)
  local mensagemTratada = string.sub(mensagem, string.len(palavraChaveMensagem) + 1)

  if palavraChaveMensagem == Constantes.NovoJogador then
    inicializaDadosJogador(mensagemTratada)
  elseif palavraChaveMensagem == Constantes.Semente then
    semente = decodificador.semente(mensagemTratada)
  elseif palavraChaveMensagem == Constantes.SelecaoDiscos then
    removeDiscos(mensagemTratada)
  elseif palavraChaveMensagem == Constantes.Pontuacao then
    contabilizaPontos(mensagemTratada)
  end
end

function love.load()
  love.graphics.setBackgroundColor(1, 1, 1)
  local font = love.graphics.newFont(constantes.fonte, 24)
  text = love.graphics.newText(font, "")
  pontuacao[idJogador] = 0
  mqttLove.start(constantes.host, idJogador, constantes.canalLobby,  trataMensagemRecebida)
  mqttLove.sendMessage(string.format('%s<%s>', Constantes.NovoJogador, idJogador), constantes.canalLobby)
end

function love.update(dt)
  mqttLove.checkMessages()
  local w, h = love.graphics.getDimensions()

  if semente ~= nil and #bolas == 0 then
    math.randomseed(semente)
    for i = 1, N do
      local r = math.random(R/10, R)
      local x = math.random(r, w-r)
      local y = math.random(r, h-r)
      local cor = cores[math.random(1, #cores)]
      table.insert(bolas, {r = r, x = x, y = y, cor = cor})
    end
    mqttLove.changeChannel(constantes.canalJogo)
  end
end

function love.draw()
  for i = 1, #bolas do
    love.graphics.setColor(bolas[i].cor[1], bolas[i].cor[2], bolas[i].cor[3])
    love.graphics.circle("fill", bolas[i].x, bolas[i].y, bolas[i].r)
  end
    
  local h = 0
  for chave, valor in pairs(pontuacao) do
    text:set(string.format(constantes.totalPontos, chave, valor))
    if chave == idJogador then
      love.graphics.setColor(255.0, 0, 0)
      love.graphics.draw(text, 0, h)
    else
      love.graphics.setColor(0, 0, 0)
      love.graphics.draw(text, 0, h)
    end
    h = text:getHeight()
  end
end

function love.mousepressed (x, y)
  mqttLove.sendMessage(string.format('%s<%i><%i><%s>', Constantes.SelecaoDiscos, x, y, idJogador), constantes.canalJogo)
end

