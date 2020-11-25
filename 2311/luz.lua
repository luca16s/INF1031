msgr = require "mqttNodeMCULibrary"
local server = "1234node"
local serverid = server .. node.random(1000)
local sensor = 0
local function readlum()
local lum = adc.read(sensor)
print("luminosidade:", lum)
return lum
end
local function handlereq (msg)
    readlum()
end
msgr.start("192.168.1.2", serverid, server, handlereq)
