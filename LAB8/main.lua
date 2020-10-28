local easytext = require "easytext"
local contaPalavras = require "contapals"
local texto = nil
local textos = {}

function love.load()
  local file = love.filesystem.newFile("texto.txt")
  file:open("r")
  texto = file:read()
  file:close()

  local w, h = love.graphics.getDimensions()
  local x = w/2
  local y = h/2
  
  local tabelaOrdenada = contaPalavras.contarPalavrasRepetidas(texto)
  
  for i=1, 10 do
    textos[i] = easytext.new("game", 32, tabelaOrdenada[i])
  end
end

function love.update()
end

local function mostrapals ()
    local w, h = love.graphics.getDimensions()
    local x = w/2
    local y = h/4
    
    for i=1, 10 do
      easytext.draw(textos[i], x, y, 'c', "light_green", "light_green")
      local tx, ty = easytext.getDimensions(textos[i])
      y = y + ty
    end
  end

function love.draw()
    mostrapals()
end
