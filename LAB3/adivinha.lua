function RetornarNumeroAleatorio()
    return math.random(1, 12)
end

function ValidaResultadoFornecido(valorFornecido, numerosRandomicos)
    return numerosRandomicos[0] * numerosRandomicos[1] == valorFornecido
end

math.randomseed(os.time())
local numerosRandomicos = {}
numerosRandomicos[0] = RetornarNumeroAleatorio()
numerosRandomicos[1] = RetornarNumeroAleatorio()

print(string.format("Calcule %s x %s:", numerosRandomicos[0], numerosRandomicos[1]))

local resultadoFornecido = io.read("*n")

if ValidaResultadoFornecido(resultadoFornecido, numerosRandomicos) then
    print("muito bem!")
else
    print("vamos estudar mais um pouco")
end

