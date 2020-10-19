local easytext = require "easytext"
local maxpals = 10
local textos = {}

function love.load ()

  textos[1] = easytext.new("game", 32, "palavra 1")
  easytext.setColor (textos[1], "red")

  textos[2] = easytext.new("horrendo", 32, "palavra 2")
  easytext.setColor (textos[2], "light_blue")

  textos[3] = easytext.new("stocky", 32, "palavra 3")
  easytext.setColor (textos[3], "green")

end

function mostrapals ()
  local w, h = love.graphics.getDimensions()
  local x = w/2
  local y = 30
  for i = 1, #textos do
    easytext.draw(textos[i], x, y)
    local tx, ty = easytext.getDimensions(textos[i])
    y = y + ty
  end
  for i = 1, #textos do
    easytext.draw(textos[i], x, y, "ne")
    local tx, ty = easytext.getDimensions(textos[i])
    y = y + ty
  end
end

function love.draw()
  love.graphics.setBackgroundColor(0.2,0.2,0.2)
  mostrapals()
end