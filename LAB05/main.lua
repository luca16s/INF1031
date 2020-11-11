local largura = 800
local altura = 800

function PintaTabuleiro(cor, posicaoX, posicaoY, width, heigth)
  love.graphics.setColor(cor)
  love.graphics.rectangle("fill", posicaoX, posicaoY, width, heigth)
end

function PintaPecas(cor, x, y)
  love.graphics.setColor(cor)
  love.graphics.circle("fill", x, y, 40)
end

function love.load()
  love.window.setTitle("Damas")
  love.window.setMode(largura, altura)
  love.graphics.setBackgroundColor(1, 1, 1)
end

function love.update ()
end

function love.draw ()
  local x = 0
  local y = 0
  local corVermelho = {255, 0, 0}
  local corVerde = {0, 255, 0}
  local corPreta = {0, 0, 255}
  local corBranca = {255, 255, 255}
  
  for linha=1, 8, 1 do
    for coluna=1, 8, 1 do
        if linha%2 == 0 then
          if coluna%2 == 0 then
            PintaTabuleiro(corVermelho, x, y, 100, 100)
          else
            PintaTabuleiro(corVerde, x, y, 100, 100)
          end
        else
          if coluna%2 == 0 then
            PintaTabuleiro(corVerde, x, y, 100, 100)
          else
            PintaTabuleiro(corVermelho, x, y, 100, 100)
          end
        end
        x = x+100
    end
    y = y+100
    x = 0
  end
  
  
  x = 0
  y = 100
  
  for linha=1, 3, 1 do
    for coluna=1, 8, 1 do
      if linha%2 == 0 then
        if coluna%2 == 0 then
          PintaPecas(corPreta, x+50, y-50)
        end
        x = x+100
      else
        if coluna%2 == 0 then
          PintaPecas(corPreta, x-50, y-50)
        end
        x = x+100
      end
    end
    y = y+100
    x = 0
  end
  
  
  x = 0
  y = 600
  
  for linha=1, 3, 1 do
    for coluna=1, 8, 1 do
      if linha%2 == 0 then
        if coluna%2 == 0 then
          PintaPecas(corBranca, x-50, y-50)
        end
        x = x+100
      else
        if coluna%2 == 0 then
          PintaPecas(corBranca, x+50, y-50)
        end
        x = x+100
      end
    end
    y = y+100
    x = 0
  end

end
