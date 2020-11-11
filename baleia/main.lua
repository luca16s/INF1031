-- requisita módulo 
msgr = require "mqttLoveLibrary"

-- declara variáveis globais
local canal = "canalunico"
local host = "127.0.0.1"
local baleia -- armazena a imagem
local mostrabaleia = false  -- indica se mostra ou não
local minhamat = 'luca16s' -- SEU NUMERO DE MATRICULA
local W, H = 400, 300

function love.keypressed(key)
  if(key == "return") then
   msgr.sendMessage("sinal", canal)
  end
end

-- chamada quando recebe uma mensagem
local function mensagemRecebida (mensagem)
  if(mensagem == "sinal") then
    mostrabaleia = not mostrabaleia
  end
end

function love.load()
  -- conectar com servidor: cuidado com segundo e terceiro args
  msgr.start(host, minhamat, canal,  mensagemRecebida)  
  baleia = love.graphics.newImage("whale.png")
  love.window.setMode(W,H)
  love.graphics.setBackgroundColor (0.5, 0.2,0)
end

function love.update(dt)
  msgr.checkMessages() -- tem que constar no love.update!!!
end

function love.draw()
  love.graphics.print("Aperte <enter>!", W/3, H/10)
  if mostrabaleia then
    love.graphics.draw(baleia, W/3, H/3, 0, 0.5)
  end
end

