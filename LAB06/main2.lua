local discs = {}

local function generatediscs (w, h)
  math.randomseed(os.time())
  for i = 1, 150 do
    local lr = math.random(10,40)
    local lx = math.random(lr,w-lr)
    local ly = math.random(lr,h-lr)
    local lcolor = {0.9*math.random(), 0.9*math.random(), 0.9*math.random()}
    table.insert(discs, {r = lr, x = lx, y = ly, color = lcolor})
  end
end

local function buscaPosicao(posicaoEixoX, posicaoEixoY)
  for i = #discs, 1, -1 do
    if math.sqrt((posicaoEixoX - discs[i].x)^2 + (posicaoEixoY - discs[i].y)^2) <= discs[i].r then
      return i
    end
  end
end

local function removeDisco(discoRemover)
  if discoRemover ~= nil then
    table.remove(discs, discoRemover)
  end
end

function love.load ()
  local larg, alt = love.graphics.getDimensions()
  generatediscs(larg, alt)
  love.graphics.setBackgroundColor(1,1,1)
end

local function drawdiscs ()
  for i = 1, #discs do
    love.graphics.setColor(discs[i].color[1],discs[i].color[2],discs[i].color[3])
    love.graphics.circle("fill",discs[i].x,discs[i].y,discs[i].r)
  end
end

function love.draw ()
  drawdiscs()
end

function love.mousepressed(x, y)
  posicao = buscaPosicao(x, y)
  removeDisco(posicao)
end