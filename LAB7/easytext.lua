local cores = {
    black = {0, 0, 0},
    white = {1, 1, 1},
    red =  {1, 0, 0},
    green =  {0.13, 0.47, 0.18},
    light_green = {0.15, 0.75, 0.25},
    blue =  {0.25, 0.1, 0.85},
    light_blue = {0.1, 0.7, 0.85}
  }

  local ancoras = {
    -- valores válidos para ancoras:
    no = true, n = true, ne = true, o = true, c = true, e = true, so = true, s = true, se = true}

  local text = {}

  text.new = function (fontname, tam, str)
    local meutexto = {}
    local fonte = love.graphics.newFont(fontname .. ".ttf", tam)
    local textoLove = love.graphics.newText(fonte, str)
    meutexto.textoLove = textoLove
    meutexto.cor = cores.black
    return meutexto
  end

  text.setString = function (obj, str)
      
  end

  text.setColor = function (meutexto, cor1, cor2, cor3)
    meutexto.cor = cores.black
    
    if type(cor1) == "string" then
      -- verifica se passou uma cor válida
      if cores[cor1]  ~= nil then
        meutexto.cor = cores[cor1]
      end
    else
      -- assumo que passou diretamente uma tripla rgb
      meutexto.cor = {cor1, cor2, cor3}
    end
  end

  text.setFillColor = function (meutexto, cor1, cor2, cor3)
    -- implementar
  end

  text.setLineColor = function (meutexto, cor1, cor2, cor3)
    -- implementar
  end

  local function cantoesqsup (x, y, dx, dy, ancora)
    if ancora == "c" then 
      x = x - dx/2
      y = y - dy/2
    elseif ancora == "ne" then
      x = x - dx
    else
      -- outros casos
    end
    return x, y
  end

  text.draw = function (meutexto, x, y, ancora)
    local dx, dy = meutexto.textoLove:getDimensions()
    love.graphics.setColor(meutexto.cor)
    ancora = ancora or "c"
    assert (ancoras[ancora], "ancora inexistente")
    local novox, novoy = cantoesqsup (x, y, dx, dy, ancora)
    love.graphics.draw(meutexto.textoLove, novox, novoy)
  end

  text.getDimensions = function (meutexto)
    local dimx, dimy =  meutexto.textoLove:getDimensions()
    return dimx, dimy
  end

  return text