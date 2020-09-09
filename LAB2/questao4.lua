function RetornaPercentualSalario(salarioBase)
  return salarioBase * 5/100
end

function SalarioAtual(salarioBase, anosCompletados)
    local salarioAtual = salarioBase + RetornaPercentualSalario(salarioBase)
    if anosCompletados ~= 1 then
      salarioAtual = SalarioAtual(salarioAtual, anosCompletados - 1)
    end
    return salarioAtual
end

print("Insira o salário base do funcionário: ")
local salarioBase = 100--io.read("*n")
print("Insira a quantidade de anos completos do funcionário na empresa: ")
local quantidadeAnosTrabalhados = 5--io.read("*n")
local salarioCorrespondente = SalarioAtual(salarioBase, quantidadeAnosTrabalhados)
print(string.format("O salário correspondente após %s anos será de R$ %.2f", quantidadeAnosTrabalhados, salarioCorrespondente))