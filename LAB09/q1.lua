local obj = { -- objeto em movimento 
  r = 40, -- raio do objeto
  v = 200, -- modulo da velocidade
}
local audio -- variável de escopo global no contexto desta classe, não podendo ser utilizada por outras classes.

function love.load()
  local w, h = love.graphics.getDimensions() -- recupera as dimensões da tela.
  math.randomseed(os.time()) -- Determina a semente de randomização baseado nos segundos.
  obj.x = w/2 -- Divide o comprimento ao meio.
  obj.y = h/2 -- Divide a altura ao meio.
  local theta = math.random() * 2 * math.pi -- Define o valor em radianos baseado em um valor randomico.
  obj.vx = obj.v * math.cos(theta) -- vel vx inicial 
  obj.vy = obj.v * math.sin(theta) -- vel vy inicial
  audio = love.audio.newSource("WoodWhack.wav","static") -- Define a variável áudio do tipo de efeito sonoro.
end

function love.draw()
  love.graphics.setBackgroundColor (1 ,1 ,1) -- Define a cor do fundo
  love.graphics.setColor (1.0 ,0.5 ,0)  -- Define a cor do objeto a ser desenhado
  love.graphics.circle("fill",obj.x,obj.y,obj.r) -- Desenha o círculo
end

function love.update (dt)

  -- anda
  obj.x = obj.x + obj.vx*dt -- movimenta o circulo no Eixo X
  obj.y = obj.y + obj.vy*dt -- movimenta o circulo no Eixo Y

  -- trata colisao
  local w, h = love.graphics.getDimensions() -- recupera as dimensões da tela.
  
  if obj.x < obj.r then -- Se a posição do disco no eixo X for menor que o raio ele mantém o sentido.
    obj.vx = math.abs(obj.vx) -- Inverte o sentido do movimento de positivo para negativo e vice-versa
    audio:stop() audio:play() -- Em caso do áudio estar tocando o mesmo é paralisado para que se possa reiniciar o toque.
  elseif obj.x > w-obj.r then -- Se a posição do disco no eixo X for maior que o comprimento + o raio inverte o sentido.
    obj.vx = -math.abs(obj.vx) -- Inverte o sentido do movimento de positivo para negativo e vice-versa
    audio:stop() audio:play() -- Em caso do áudio estar tocando o mesmo é paralisado para que se possa reiniciar o toque.
  end
  if obj.y < obj.r then -- Se a posição do disco no eixo Y for menor que o raio ele mantém o sentido.
    obj.vy = math.abs(obj.vy) -- Inverte o sentido do movimento de positivo para negativo e vice-versa
    audio:stop() audio:play() -- Em caso do áudio estar tocando o mesmo é paralisado para que se possa reiniciar o toque.
  elseif obj.y > h-obj.r then -- Se a posição do disco no eixo Y for maior que o comprimento + o raio inverte o sentido.
    obj.vy = -math.abs(obj.vy) -- Inverte o sentido do movimento de positivo para negativo e vice-versa
    audio:stop() audio:play() -- Em caso do áudio estar tocando o mesmo é paralisado para que se possa reiniciar o toque.
  end
end

function love.quit()
  os.exit() -- Encerra a execução do aplicativo
end