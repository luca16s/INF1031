function Soma(numero)
    local total = numero
    if numero ~= 0 then
        total = total + Soma(numero - 1)
    end
    return total
end

print("Insira um número positivo: ")
local numeroEscolhido = io.read("*n")

local totalSomado = Soma(numeroEscolhido)

print(string.format("A soma total dos números de 1 até %s é de %s", numeroEscolhido, totalSomado))
