local mqttLove = require "mqttLoveLibrary"
local decodificador = require "decodificador"
local constantes = require "constantes"
local movimentoMira = 0
local acaoJogador = ''

local bolhas = {}
local larg, alt = nil, nil

local function geraBolhas(w, h)
  math.randomseed(os.time())
  for i = 1, 30 do
    local lr = math.random(10,40)
    local lx = math.random(lr,w-lr)
    local lcolor = {0.9*math.random(), 0.9*math.random(), 0.9*math.random()}
    table.insert(bolhas, {r = lr, x = lx, y = h/4, color = lcolor})
  end
end

local function desenhaBolhas()
  for i = 1, #bolhas do
    love.graphics.setColor(bolhas[i].color[1], bolhas[i].color[2], bolhas[i].color[3])
    love.graphics.circle("fill", bolhas[i].x,bolhas[i].y, bolhas[i].r)
  end
end

local function desenhaLinha(movimento)
  love.graphics.line(movimento, alt-30, movimento, alt/4)
end

local function movimentaMiraQuadrado(direcao, distancia)
  return direcao*(distancia*10)
end

local function trataMensagemRecebida(mensagem)
    if mensagem == Constantes.ComandoMoveDireita then
      acaoJogador = Constantes.ComandoMoveDireita
    elseif mensagem == Constantes.ComandoMoveEsquerda then
      acaoJogador = Constantes.ComandoMoveEsquerda
    elseif mensagem == Constantes.ComandoParaDireita then
      acaoJogador = Constantes.ComandoParaDireita
    elseif mensagem == Constantes.ComandoParaEsquerda then
      acaoJogador = Constantes.ComandoParaEsquerda
    elseif mensagem == Constantes.ComandoAtirar then
      acaoJogador = Constantes.ComandoAtirar
    end
  end

function love.load()
  larg, alt = love.graphics.getDimensions()
  geraBolhas(larg, alt)
  love.graphics.setBackgroundColor(1,1,1)
  movimentoMira = larg/2
  local idJogador = 1234
  mqttLove.start(constantes.host, idJogador, constantes.canalJogo,  trataMensagemRecebida)
end

function love.update(dt)
  mqttLove.checkMessages()

  if acaoJogador == Constantes.ComandoMoveDireita then
    movimentoMira = movimentoMira + movimentaMiraQuadrado(1, dt)
  elseif  acaoJogador == Constantes.ComandoMoveEsquerda then
    movimentoMira = movimentoMira + movimentaMiraQuadrado(-1, dt)
  end
end

function love.draw()
  love.graphics.polygon('fill', larg/2-10, alt-10, larg/2+10, alt-10, larg/2, alt-30)
  desenhaLinha(movimentoMira)
  desenhaBolhas()
end