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
    no = true,
    n = true,
    ne = true,
    o = true,
    c = true,
    l = true,
    so = true,
    s = true,
    se = true
  }

  local text = {}

  text.new = function (fontname, tam, str)
    local meutexto = {}
    tam = tam or 32    
    local fonte = love.graphics.newFont(fontname .. ".ttf", tam)
    local textoLove = love.graphics.newText(fonte, str)
    meutexto.textoLove = textoLove
    return meutexto
  end

  text.setString = function (obj, str)
      
  end

  text.setColor = function (meutexto, cor1, cor2, cor3)
    if cor1 == nil then
      return cores.black
    end
    if type(cor1) == "string" then
      if cores[cor1] == nil then
        return cores.black
      end
      return cores[cor1]
    else
      return {cor1, cor2, cor3}
    end
  end  

  text.setFillColor = function (meutexto, cor1, cor2, cor3)
    if type(cor1) == "string" then
      love.graphics.setColor(text.setColor(meutexto, cor1))
    else
      love.graphics.setColor(text.setColor(meutexto, cor1, cor2, cor3))
    end
  end

  text.setLineColor = function (meutexto, cor1, cor2, cor3)
    if cor1 == nil then
      assert (cores[cor1], "cor inexistente")
    end
    if type(cor1) == "string" then
      if cores[cor1] == nil then
        return cores.black
      end
      love.graphics.setColor(cores[cor1])
    else
      love.graphics.setColor(cor1, cor2, cor3)
    end    
  end

  local function cantoesqsup (x, y, dx, dy, ancora)
    if ancora == "no" then
      x = x
      y = y
    elseif ancora == "o" then
      x = x
      y = y - dy/2
    elseif ancora == "so" then
      x = x
      y = y + dy
    elseif ancora == "n" then
      x = x - dx/2
    elseif ancora == "l" then
      x = x - dx
      y = y - dy/2
    elseif ancora == "s" then
      x = x - dx/2
      y = y + dy
    elseif ancora == "ne" then
      x = x - dx
    elseif ancora == "c" then 
      x = x - dx/2
      y = y - dy/2
    elseif ancora == "se" then
      x = x - dx
      y = y + dy
    end
    return x, y
  end

  text.draw = function (meutexto, x, y, ancora, corFonte, corRetangulo)
    local dx, dy = meutexto.textoLove:getDimensions()
    
    if corFonte == "string" then
      text.setFillColor(meutexto, corFonte)
    else
      text.setFillColor(meutexto, corFonte.cor1, corFonte.cor2, corFonte.cor3)
    end
    
    ancora = ancora or "c"
    assert (ancoras[ancora], "ancora inexistente")
    
    local novox, novoy = cantoesqsup(x, y, dx, dy, ancora)
    
    if corRetangulo ~= nil then
      love.graphics.rectangle("line", novox, novoy, text.getDimensions(meutexto))
      text.setLineColor(meutexto, corRetangulo)
    end
    
    love.graphics.draw(meutexto.textoLove, novox, novoy)
  end

  text.getDimensions = function (meutexto)
    local dimx, dimy = meutexto.textoLove:getDimensions()
    return dimx, dimy
  end

  return text