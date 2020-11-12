local host = "127.0.0.1"
local canal = "luca16s"
local mqtt = require "mqttLoveLibrary"
local usuario = 'luca16s'

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

local function decodificaCoordenadas(mensagemRecebida)
  local coordenadaDecodificada = {}
  local contador = 0

  string.gsub(mensagemRecebida,"<%d+>", function(coordenada)
      coordenadaDecodificada[contador] = string.gsub(coordenada, "%p+", "")
      contador = contador + 1
  end)

return coordenadaDecodificada[0], coordenadaDecodificada[1]

end

local function mensagemRecebida (mensagem)
  local x, y = decodificaCoordenadas(mensagem)
  
  if string.match(mensagem, "<SEL>") ~= nil then
    for i = #bolas, 1, -1 do
      if math.sqrt((x-bolas[i].x)^2 + (y-bolas[i].y)^2) < bolas[i].r then
        table.remove(bolas, i)
        break
      end
    end
  end
end

function love.load ()
  local w, h = love.graphics.getDimensions()
  -- generate bolas
  math.randomseed(S)
  for i = 1, N do
    local r = math.random(R/10,R)
    local x = math.random(r,w-r)
    local y = math.random(r,h-r)
    local cor = cores[math.random(1, #cores)]
    table.insert(bolas, {r = r, x = x, y = y, cor = cor})
  end
  -- init graphics
  love.graphics.setBackgroundColor(1,1,1)
  local font = love.graphics.newFont("Arial.ttf",24)
  text = love.graphics.newText(font,"")
  mqtt.start(host, usuario, canal,  mensagemRecebida)
end

function love.update(dt)
  mqtt.checkMessages() -- tem que constar no love.update!!!
end

function love.draw ()
  for i = 1, #bolas do
    love.graphics.setColor(bolas[i].cor[1],bolas[i].cor[2],bolas[i].cor[3])
    love.graphics.circle("fill",bolas[i].x,bolas[i].y,bolas[i].r)
  end
  text:set(string.format("Pontos: %.1f",pontos))
  love.graphics.setColor(0,0,0)
  love.graphics.draw(text,0,0)
end

function love.mousepressed (x, y, bt)
  mqtt.sendMessage(string.format('<SEL><%i><%i><%s>', x, y, usuario), canal)
end

