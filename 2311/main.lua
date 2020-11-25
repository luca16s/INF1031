local msgr = require "mqttLoveLibrary"
local serverchan = "1234node"
local lum
local serverid
local minhamat = "luca16s"
local meucanal = minhamat .. "love"
local function tratamensagem (msg)
-- extrai informa¸c~oes da mensagem!
end
function love.keypressed (key)
msgr.sendMessage ("<req><" .. meucanal .. ">", serverchan)
end
function love.load ()
msgr.start("192.168.1.2", minhamat, meucanal,
tratamensagem)
end
function love.update(dt)
msgr.checkMessages() -- tem que constar no love.update!!!
end
function love.draw ()
if serverid then
-- se j´a recebeu alguma coisa mostra na janela
end
end