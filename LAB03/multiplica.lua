function RetornarNumeroAleatorio()
    return math.random(1, 12)
end

function CalcularOperacao(numerosRandomicos, operacao)
    if operacao == '+' then
        return numerosRandomicos[0] + numerosRandomicos[1]
    elseif operacao == '-' then
        return numerosRandomicos[0] - numerosRandomicos[1]
    elseif operacao == 'x' then
        return numerosRandomicos[0] * numerosRandomicos[1]
    end
end

function ValidaResultadoFornecido(valorFornecido, numerosRandomicos, operacao)
    return CalcularOperacao(numerosRandomicos, operacao) == valorFornecido
end

math.randomseed(os.time())
local numerosRandomicos = {}
numerosRandomicos[0] = RetornarNumeroAleatorio()
numerosRandomicos[1] = RetornarNumeroAleatorio()

local operacoes = {}
operacoes[0] = '+'
operacoes[1] = '-'
operacoes[2] = 'x'

local operacaoRandomizada = operacoes[math.random(0, 2)]
print(string.format("Calcule %s %s %s:", numerosRandomicos[0], operacaoRandomizada, numerosRandomicos[1]))

local resultadoFornecido = io.read("*n")

if ValidaResultadoFornecido(resultadoFornecido, numerosRandomicos, operacaoRandomizada) then
    print("muito bem!")
else
    print("vamos estudar mais um pouco")
end
