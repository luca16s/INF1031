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


function limita_tentativas(chute0,tent)
    tent = 20
    chute0 = io.read ("*n")
      if tent < 0 then
        return  false
     if chute0 < valor_pc then
        return tent - 1
      elseif chute0 > valor_p then
        return tent -1
        end
      end
    end