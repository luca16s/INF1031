local msgr = require 'mqttNodeMCULibrary'

local swDireito = 1
local swEsquerdo = 2
local matricula = '1234'
local ultimaAcao = nil
local botaoDireitoMillis = 0
local botaoEsquerdoMillis = 0

local function mandaMensagemAtirar()
  if botaoEsquerdoMillis - botaoDireitoMillis < 1000000 and botaoEsquerdoMillis - botaoDireitoMillis >= 0 then
    msgr.sendMessage('atira', 'JOGO_ESTOURA_BOLHAS')
  end
end

local function mandaMensagemDireita(level)
  if level ~= ultimaAcao then
    ultimaAcao = level
    if level == 0 then
      msgr.sendMessage('move-dir', 'JOGO_ESTOURA_BOLHAS')
      botaoDireitoMillis = tmr.now()
      mandaMensagemAtirar()
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
      botaoEsquerdoMillis = tmr.now()
      mandaMensagemAtirar()
    elseif level == 1 then
      msgr.sendMessage('para-esq', 'JOGO_ESTOURA_BOLHAS')
    end
  end
end

local function mensagemRecebida() end

gpio.mode(swDireito, gpio.INPUT, gpio.PULLUP)
gpio.mode(swEsquerdo, gpio.INPUT, gpio.PULLUP)
gpio.trig(swDireito, 'both', mandaMensagemDireita)
gpio.trig(swEsquerdo, 'both', mandaMensagemEsquerda)

msgr.start('192.168.1.2', matricula, 'JOGO_ESTOURA_BOLHAS', mensagemRecebida)
