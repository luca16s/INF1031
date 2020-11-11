local led1 = 3
local led2 = 6
local sw1 = 1
local sw2 = 2

local ledstate = false

local function pincb(level, timestamp)
  ledstate =  not ledstate
  if ledstate then 
    gpio.write(led2, gpio.HIGH);
  else
    gpio.write(led2, gpio.LOW);
  end
end

gpio.mode(led1, gpio.OUTPUT)
gpio.mode(led2, gpio.OUTPUT)

gpio.write(led1, gpio.LOW)
gpio.write(led2, gpio.LOW)

gpio.mode(sw1,gpio.INT,gpio.PULLUP)
gpio.mode(sw2,gpio.INT,gpio.PULLUP)


gpio.trig(sw2, "down", pincb)
