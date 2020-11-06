local obj = { -- objeto em movimento 
  r = 40, -- raio do objeto
  v = 200, -- modulo da velocidade
}

local coresDisco = {
    corDiscoPadrao = { 1.0, 0.5, 0},
    corDiscoSelecionado = {255.0, 0.0, 0.0}
}
  
local audio
local discoSelecionado = false

function movimentaDisco(w, h, dt)
  obj.x = obj.x + obj.vx*dt 
    obj.y = obj.y + obj.vy*dt
    
    if obj.x < obj.r then
      obj.vx = math.abs(obj.vx)
      audio:stop() audio:play()
    elseif obj.x > w-obj.r then
      obj.vx = -math.abs(obj.vx)
      audio:stop() audio:play()
    end
    
    if obj.y < obj.r then
      obj.vy = math.abs(obj.vy)
      audio:stop() audio:play()    
    elseif obj.y > h-obj.r then
      obj.vy = -math.abs(obj.vy)
      audio:stop() audio:play()    
    end
end

function love.load()
  local w, h = love.graphics.getDimensions() 
  math.randomseed(os.time())
  obj.x = math.random(w-obj.r)
  obj.y = math.random(h-obj.r)
  local theta = math.random() * 2 * math.pi
  obj.vx = obj.v * math.cos(theta) -- vel vx inicial 
  obj.vy = obj.v * math.sin(theta) -- vel vy inicial
  audio = love.audio.newSource("WoodWhack.wav","static")
end

function love.draw()
  love.graphics.setBackgroundColor (1 ,1 ,1) 
  
  if discoSelecionado == true then
    love.graphics.setColor (coresDisco.corDiscoSelecionado)
  else
    love.graphics.setColor (coresDisco.corDiscoPadrao)
  end
  
  love.graphics.circle("fill", obj.x, obj.y, obj.r)
end

function love.update(dt)
  local w, h = love.graphics.getDimensions()
  
  if love.keyboard.isDown("space") == true and discoSelecionado == false then    
    movimentaDisco(w, h, 0)
  else
    if discoSelecionado == false then
      movimentaDisco(w, h, dt)
    elseif love.keyboard.isDown("left") == true then
      obj.x = obj.x + obj.vx*-1*(dt)    
    elseif love.keyboard.isDown("up") == true then
      obj.y = obj.y + obj.vy*(dt)    
    elseif love.keyboard.isDown("right") == true then
      obj.x = obj.x + obj.vx*dt    
    elseif love.keyboard.isDown("down") == true then
      obj.y = obj.y + obj.vy*-1*(dt)
    end
  end
end

function love.quit()
  os.exit()
end

function love.mousepressed(posicaoEixoX, posicaoEixoY, button)
  if math.sqrt((posicaoEixoX - obj.x)^2 + (posicaoEixoY - obj.y)^2) <= obj.r and discoSelecionado == false then
    discoSelecionado = true
  else
    discoSelecionado = false
    love.graphics.setColor(coresDisco.corDiscoPadrao)
  end
end