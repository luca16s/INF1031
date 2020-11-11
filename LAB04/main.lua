local largura = 400
local altura = 400

function love.load()
  love.window.setMode(largura, altura)
  love.graphics.setBackgroundColor(1, 1, 1)
  clock = love.graphics.newImage("relogio.png")
  quad = love.graphics.newQuad(0, 0, clock:getWidth(), clock:getHeight(), 300, 300)
end

function love.update ()
  -- atualiza valores da hora atual
  local data = os.date("*t")
  segundo = data.sec
  minuto = data.min
  hora = data.hour-12
  dia = data.day
end

function love.draw ()
  love.graphics.setColor(0, 0, 0)
  love.graphics.draw(clock, quad, 50, 50)
  texto = love.graphics.newText(love.graphics.getFont(), string.format("%s", dia))
  love.graphics.draw(texto, 190, 220)
  love.graphics.push()
  
  love.graphics.translate(largura/2, altura/2)
  love.graphics.scale (largura/2, -altura/2)
  love.graphics.setLineWidth(0.01)
  love.graphics.push()
  
  love.graphics.rotate(-segundo*math.pi/30)
  love.graphics.setColor(0.0, 0.0, 0.0)
  love.graphics.line(0, 0, 0, 1/2)
  love.graphics.pop()
  
  love.graphics.push()
  love.graphics.rotate(-minuto*math.pi/30)
  love.graphics.setColor(255.0, 0.0, 0.0)
  love.graphics.line(0,0,0, 1/2)
  love.graphics.pop()
  
  love.graphics.push()
  love.graphics.rotate(-hora*(-math.pi/30))
  love.graphics.setColor(0.0, 128.0, 0.0)
  love.graphics.line(0, 0, 0, 1/2)
  love.graphics.pop()
  love.graphics.pop()
end
