local largura = 400
local altura = 400

function love.load()
  love.window.setMode(largura, altura)
  love.graphics.setBackgroundColor (1, 1, 1)
end

function love.update ()
  -- atualiza valores da hora atual
  local data = os.date("*t")
  segundo = data.sec
  minuto = data.min
  hora = data.hour
  dia = data.day
end

function love.draw ()
  love.graphics.setColor(0, 0, 0)
  love.graphics.circle("line", largura/2, altura/2, 130, 130)
  love.graphics.push()
  -- translada origem para centro da janela
  love.graphics.translate(largura/2, altura/2)
  -- muda escala para x e y ficarem entre -1 e +1
  love.graphics.scale (largura/2, -altura/2)
  love.graphics.setLineWidth(0.01)
  love.graphics.setColor(0.0, 0.0, 0.0)
  love.graphics.line(0, 0, 0, 1/2)
  love.graphics.push()
  -- roda para refletir segundos
  love.graphics.rotate(-segundo*math.pi/30)
  love.graphics.setColor(0.0, 0.0, 1.0)
  love.graphics.line(0, 0, 0, 1/2)
  love.graphics.line(0, 0, 0, 1/2)
  love.graphics.pop()
  love.graphics.pop()
end
