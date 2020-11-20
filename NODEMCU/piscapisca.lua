local led1 = 3
local led2 = 6

local apagado = true

local function piscapisca(t)
  if apagado then
    gpio.write(led1, gpio.HIGH);
  else
    gpio.write(led1, gpio.LOW);
  end
  apagado = not apagado
end

-- coloca os pinos dos leds em modo de saida
gpio.mode(led1, gpio.OUTPUT)
gpio.mode(led2, gpio.OUTPUT)

-- apaga os leds
gpio.write(led1, gpio.LOW);
gpio.write(led2, gpio.LOW);

local mytimer = tmr.create()
mytimer:register(500, tmr.ALARM_AUTO, piscapisca)
mytimer:start()