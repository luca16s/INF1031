function ConvertePrecoGasolina(precoGalao, taxaConversao)
    local precoLitrosGasolina = precoGalao * 3.7854;
    return precoLitrosGasolina * taxaConversao;
end

print("Digite o preço do galão da gasolina dos EUA (US$): ")
local precoGalao = io.read("*n")
print("Insira a taxa de conversão de US$")
local taxaConversao = io.read("*n")
print(string.format("O equivalente em BRL do preço da gasolina é: %s", ConvertePrecoGasolina(precoGalao, taxaConversao)))