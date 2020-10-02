local largura = 800
local altura = 800

function PintaQuadrados(cor, posicaoX, posicaoY, width, heigth)
  love.graphics.setColor(cor)
  love.graphics.rectangle("fill", posicaoX, posicaoY, width, heigth)
end

function love.load()
  love.window.setTitle("Damas")
  love.window.setMode(largura, altura)
  love.graphics.setBackgroundColor(1, 1, 1)
end

function love.update ()
end

function love.draw ()
  love.graphics.push()
  corMarromEscuro = {99,69,39} --love.graphics.setColor(99,69,39, 1)
  corMarromClaro = {198,168,138}  --love.graphics.setColor(198,168,138, 1)
  local x = 0
  local y = 0
  for i=1, 8 do
    for j=1, 8 do
        if j%2 == 0 then
          PintaQuadrados(corMarromEscuro, x, y, 100, 100)
        else
          PintaQuadrados(corMarromClaro, x, y, 100, 100)
        end
        x = x+100
    end
    y = y+100
  end
  love.graphics.pop()
end
