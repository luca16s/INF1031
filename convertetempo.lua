local quantidadeSegundosDia = 24*60*60
local quantidadeSegundosHora = 60*60
local quantidadeSegundosMinuto = 60

print("Por favor, insira a quantidade de segundos: ")
local segundosInformados = io.read("*n")
print()

local dias = segundosInformados // quantidadeSegundosDia
local horas = (segundosInformados % quantidadeSegundosDia) // quantidadeSegundosHora
local minutos = (segundosInformados % quantidadeSegundosHora) // quantidadeSegundosMinuto
local segundos = segundosInformados % quantidadeSegundosMinuto

-- Resolução exercício 1
print(dias)
print(horas)
print(minutos)
print(segundos)
print()

-- Resolução exercício 2
print(string.format("%s dias, %s horas, %s minutos e %s segundos", dias, horas, minutos, segundos))
print()
-- Resolução exercício 3
function InsereVirgula(mensagem)
  if mensagem ~= nil and string.len(mensagem) > 1 then
    return mensagem .. ", "
  else
    return mensagem
  end
end

local mensagem = ""

if dias > 0 then
  if dias == 1 then
    mensagem = string.format("%s dia", dias)
  else
    mensagem = string.format("%s dias", dias)
  end
end

if horas > 0 then
  mensagem = InsereVirgula(mensagem)
  if horas == 1 then
    mensagem = mensagem .. string.format("%s hora", horas)
  else
    mensagem = mensagem .. string.format("%s horas", horas)
  end
end

if minutos > 0 then
  mensagem = InsereVirgula(mensagem)
  if minutos == 1 then
    mensagem = mensagem .. string.format("%s minuto", minutos)
  else
    mensagem = mensagem .. string.format("%s minutos", minutos)
  end
end

if segundos > 0 then
  mensagem = InsereVirgula(mensagem)
  if segundos == 1 then
    mensagem = mensagem .. string.format("e %s segundo", segundos)
  else
    mensagem = mensagem .. string.format("e %s segundos", segundos)
  end
end

print(mensagem)
print()