function CalculaQuantidadeSegundos()
    local quantidadeSegundosDia = 24*60*60
    local quantidadeSegundosHora = 60*60
    local quantidadeSegundosMinuto = 60
    return quantidadeSegundosDia, quantidadeSegundosHora, quantidadeSegundosMinuto 
end

function ConverteSegundos(segundosInformados)
    local quantidadeSegundosDia, quantidadeSegundosHora, quantidadeSegundosMinuto = CalculaQuantidadeSegundos()

    local dias = segundosInformados // quantidadeSegundosDia
    local horas = (segundosInformados % quantidadeSegundosDia) // quantidadeSegundosHora
    local minutos = (segundosInformados % quantidadeSegundosHora) // quantidadeSegundosMinuto
    local segundos = segundosInformados % quantidadeSegundosMinuto

return dias, horas, minutos, segundos
end

print("Insira a quantidade de segundos: ")
local quantidadeSegundos = io.read("*n")

print(string.format("%s dias, %s horas, %s minutos e %s segundos", ConverteSegundos(quantidadeSegundos)))