local torres = { {}, {}, {} }
local numdiscos = 3

function desenha()
-- melhorar o desenho dos discos!
  local larg, alt = love.graphics.getDimensions()
  local x, y
  love.graphics.setLineWidth(3)
  local fonte = love.graphics.newFont("Game.ttf", 32)
  local contagemCirculos = 1
  for i = 1, 3 do
    x = i*larg/5 + larg/10
    y = alt
    for j = 1, #torres[i] do
      love.graphics.setColor(1, 1, 1)
      love.graphics.rectangle("line", x - torres[i][j]/2, y - alt/15, torres[i][j], alt/15)
      love.graphics.draw(love.graphics.newText(fonte, contagemCirculos), x - torres[i][j]/2, y - alt/15)
      y = y - alt/15
      contagemCirculos = contagemCirculos + 1
    end
  end
end

local function move(origem, destino)
    table.insert(torres[destino], 1, torres[origem][1])
    table.remove(torres[origem], 1)
end

local function hanoi(origem, destino, auxiliar, quantos)
  if quantos <= 1 then
    print (string.format("mova de %d para %d", origem, destino))
    move(origem, destino)
    -- inicialmente deixe comentado (questão 3) e depois descomente!
    sleep(1)
  else -- completar
    -- usar 3 chamadas recursivas!!!
    hanoi(origem, auxiliar, destino, quantos-1)
    hanoi(origem, destino, auxiliar, 1)
    hanoi(auxiliar, destino, origem, quantos-1)
  end
end

local function criapilha(from, n)
  local larg, alt = love.graphics.getDimensions()
  local largumatorre = larg/5
  for i = 1, n do
    torres[from][i] = largumatorre - 10*i
  end
end


function main ()
  local origem = 1
  local destino = 3
  local auxiliar = 2
  criapilha(origem, numdiscos)
  --sleep(1)
  hanoi(origem, destino, auxiliar, numdiscos)
end

