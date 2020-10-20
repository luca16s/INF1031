local easytext = require "easytext"
local maxpals = 10
local textos = {}
local id, ancora, corFonte, corRetangulo = nil

function love.load ()
  textos[1] = easytext.new("game", 32, "palavra 1")
  textos[2] = easytext.new("horrendo", nil, "palavra 2")
  textos[3] = easytext.new("stocky", 32, "palavra 3")
  textos[4] = easytext.new("game", 32, "palavra 4")
  textos[5] = easytext.new("horrendo", 32, "palavra 5")
  textos[6] = easytext.new("stocky", 32, "palavra 6")
  textos[7] = easytext.new("game", 32, "palavra 7")
  textos[8] = easytext.new("horrendo", 32, "palavra 8")
  textos[9] = easytext.new("stocky", 32, "palavra 9")
end

function mostrapals ()
  if id == nil or ancora == nil then
    return
  end
  
  local w, h = love.graphics.getDimensions()
  local x = w/2
  local y = h/2
  
  easytext.draw(textos[id], x, y, ancora, corFonte, corRetangulo)
  local tx, ty = easytext.getDimensions(textos[id])
  y = y + ty
end

function love.draw()
  love.graphics.setBackgroundColor(0.2, 0.2, 0.2)
  mostrapals()
end

function love.keypressed (key)  
  if key == "kp1" then
    id = 1
    ancora = "no"
    corFonte = "black"
    corRetangulo = "white"
  elseif key == "kp2" then
    id = 2
    ancora = "o"
    corFonte = "blue"
    corRetangulo = nil
  elseif key == "kp3" then
    id = 3
    ancora = "so"
    corFonte = nil
    corRetangulo = "light_green"
  elseif key == "kp4" then
    id = 4
    ancora = "n"
    corFonte = nil
    corRetangulo = nil
  elseif key == "kp5" then
    id = 5
    ancora = "l"
    corFonte = "orange"
    corRetangulo = "purple"
  elseif key == "kp6" then
    id = 6
    ancora = "s"
    corFonte = nil
    corRetangulo = nil
  elseif key == "kp7" then
    id = 7
    ancora = "ne"
  elseif key == "kp8" then
    id = 8
    ancora = "c"
    corFonte = nil
    corRetangulo = nil
  elseif key == "kp9" then
    id = 9
    ancora = "se"
    corFonte = nil
    corRetangulo = nil
  end
end