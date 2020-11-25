local hc

local falta = 0

function love.load(arg)
  love.window.setMode (800, 400)
  dofile(arg[1])
  hc = coroutine.create (main)
end

function love.draw()
  love.graphics.setBackgroundColor(0,0,0)
  desenha()
end


function sleep (t)
  falta = t
  coroutine.yield()
end


function love.update (dt)
  falta = falta - dt
  if falta < 0 then
    coroutine.resume (hc)
  end
end

function love.quit ()
  love.window.close()
  os.exit()
end
