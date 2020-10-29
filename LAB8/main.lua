local easytext = require "easytext"
local contaPalavras = require "contapals"
local texto = nil
local textos = {}
local tabelaOrdenada = {}
local tabelaRepetidos = {}

function love.load()
  local file = love.filesystem.newFile("texto.txt")
  file:open("r")
  texto = file:read()
  file:close()

  local w, h = love.graphics.getDimensions()
  local x = w/2
  local y = h/2
  
  tabelaOrdenada = contaPalavras.contarPalavrasRepetidas(texto)
  
  for i=1, 10 do
    textos[i] = easytext.new("game", 32, tabelaOrdenada[i].palavra)
  end
end

function love.update()
end

local function mostrapals ()
    local w, h = love.graphics.getDimensions()
    local x = w/2
    local y = h/6
    
    for i=1, 10 do
      local palavra = {}
      palavra[i] = { palavra = tabelaOrdenada[i].palavra, quantidade = tabelaOrdenada[i].quantidade }
      
      easytext.draw(textos[i], x, y, 'c', "light_green")
      local tx, ty = easytext.getDimensions(textos[i])
      tabelaRepetidos[i] = { texto = palavra, x = x, y = y, comprimento = tx, largura = ty }
      y = y + ty + 10
    end
  end

function love.draw()
    mostrapals()
end

function love.mousepressed(x, y, button)
   if button == 1 then
     local texto = contaPalavras.mostraQuantidadeEncontrada(x, y, tabelaRepetidos)
     
    if texto ~= nil then
      love.window.showMessageBox("Repetição de palavras", texto, "info")
    end
   end
end