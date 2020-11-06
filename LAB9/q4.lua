local discos = {}

local coresDisco = {
    corDiscoPadrao = { 1.0, 0.5, 0},
    corDiscoSelecionado = {255.0, 0.0, 0.0}
}
  
local audio

local function movimentaDisco(w, h, dt, disco)
    disco.x = disco.x + disco.vx*dt 
    disco.y = disco.y + disco.vy*dt
    
    if disco.x < disco.r then
      disco.vx = math.abs(disco.vx)
      audio:stop() audio:play()
    elseif disco.x > w-disco.r then
      disco.vx = -math.abs(disco.vx)
      audio:stop() audio:play()
    end
    
    if disco.y < disco.r then
      disco.vy = math.abs(disco.vy)
      audio:stop() audio:play()    
    elseif disco.y > h-disco.r then
      disco.vy = -math.abs(disco.vy)
      audio:stop() audio:play()    
    end
end

function love.load()
  local w, h = love.graphics.getDimensions()  
  local raio = 40
  local velocidade = 200
  
    math.randomseed(os.time())
  for i = 0, 20 do
    local lx = math.random(w)
    local ly = math.random(h)    
    local theta = math.random() * 2 * math.pi
    local velocidadeX = velocidade * math.cos(theta) -- vel vx inicial 
    local velocidadeY = velocidade * math.sin(theta) -- vel vy inicial
    table.insert(discos, {r = raio, x = lx, y = ly, v = velocidade, vx = velocidadeX, vy = velocidadeY, selecionado = false })
  end
  audio = love.audio.newSource("WoodWhack.wav","static")
end

function love.draw()
  love.graphics.setBackgroundColor (1, 1, 1)
  
  for i = 1, #discos do
    if discos[i].selecionado == true then
      love.graphics.setColor(coresDisco.corDiscoSelecionado)
    else
      love.graphics.setColor(coresDisco.corDiscoPadrao)
    end
    love.graphics.circle("fill", discos[i].x, discos[i].y, discos[i].r)
  end
end

function love.update(dt)
  local w, h = love.graphics.getDimensions()
  for i = 1, #discos do
    if love.keyboard.isDown("space") == true and discos[i].selecionado == false then    
      movimentaDisco(w, h, 0, discos[i])
      audio:stop()
    else
      if discos[i].selecionado == false then
        movimentaDisco(w, h, dt, discos[i])
        
      elseif love.keyboard.isDown("left") == true then
        discos[i].x = discos[i].x + discos[i].vx*-1*(dt)    
      elseif love.keyboard.isDown("up") == true then
        discos[i].y = discos[i].y + discos[i].vy*(dt)    
      elseif love.keyboard.isDown("right") == true then
        discos[i].x = discos[i].x + discos[i].vx*dt    
      elseif love.keyboard.isDown("down") == true then
        discos[i].y = discos[i].y + discos[i].vy*-1*(dt)
      end
    end
  end
end

function love.quit()
  os.exit()
end

function love.mousepressed(posicaoEixoX, posicaoEixoY)
  for i = #discos, 1, -1 do
    if math.sqrt((posicaoEixoX - discos[i].x)^2 + (posicaoEixoY - discos[i].y)^2) <= discos[i].r and discos[i].selecionado == false then
      discos[i].selecionado = true
      break
    else
      discos[i].selecionado = false
    end
  end
end