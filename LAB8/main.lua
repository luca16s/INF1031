local easytext = require "easytext"
local contapals = require "contapals"
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

  textos[1] = easytext.new("game", 32, contapals.ContarPalavrasRepetidas(texto))
end

function love.update()
end

local function mostrapals ()
    local w, h = love.graphics.getDimensions()
    local x = w/2
    local y = h/2

    easytext.draw(textos[1], x, y, 'c', "light_green", "light_green")
    local tx, ty = easytext.getDimensions(textos[1])
    y = y + ty
  end

function love.draw()
    mostrapals()
end
