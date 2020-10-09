local discs = {}
discoAnterior = nil

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

local function copiaItemTabela(t)
    local tabela = {}
    for k, v in pairs(t) do
        tabela[k] = v
    end
    return tabela
end

local function buscaDisco(posicaoEixoX, posicaoEixoY)
  for i = #discs, 1, -1 do
    if math.sqrt((posicaoEixoX - discs[i].x)^2 + (posicaoEixoY - discs[i].y)^2) <= discs[i].r then
      return discs[i]
    end
  end
end

local function corrigeCorDisco(disco)
  for i = #discs, 1, -1 do
    if disco.x == discs[i].x and disco.y == discs[i].y  and disco.r == discs[i].r then
      discs[i].color = disco.color
      return
    end
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
  discoSelecionado = buscaDisco(x, y)
  
  if discoSelecionado ~= nil then
    
    if discoAnterior ~= nil then
      corrigeCorDisco(discoAnterior)
    end
    
    discoAnterior = copiaItemTabela(discoSelecionado)
    discoSelecionado.color = {255, 0, 0}
  end
end