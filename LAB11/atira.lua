local msgr = require 'mqttNodeMCULibrary'

local swDireito = 1
local swEsquerdo = 2
local matricula = '1234'
local ultimaAcao = nil

local function mandaMensagemDireita(level)
  if level ~= ultimaAcao then
    ultimaAcao = level
    if level == 0 then
      msgr.sendMessage('move-dir', 'JOGO_ESTOURA_BOLHAS')
    elseif level == 1 then
      msgr.sendMessage('para-dir', 'JOGO_ESTOURA_BOLHAS')
    end
  end
end

local function mandaMensagemEsquerda(level)
  if level ~= ultimaAcao then
    ultimaAcao = level
    if level == 0 then
      msgr.sendMessage('move-esq', 'JOGO_ESTOURA_BOLHAS')
    elseif level == 1 then
      msgr.sendMessage('para-esq', 'JOGO_ESTOURA_BOLHAS')
    end
  end
end

local function mensagemRecebida() end

gpio.mode(swEsquerdo, gpio.INPUT, gpio.PULLUP)
gpio.mode(swDireito, gpio.INPUT, gpio.PULLUP)
gpio.trig(swEsquerdo, 'both', mandaMensagemEsquerda)
gpio.trig(swDireito, 'both', mandaMensagemDireita)

msgr.start('test.mosquitto.org', matricula, 'JOGO_ESTOURA_BOLHAS', mensagemRecebida)
