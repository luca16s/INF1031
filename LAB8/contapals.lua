local contaPalavras = {}
function ordenarTabela(tabela, ordem)
  local tabelaOrdemDecrescente = {}
  
  for k in pairs(tabela) do
    tabelaOrdemDecrescente[#tabelaOrdemDecrescente+1] = k
  end
  
  table.sort(tabelaOrdemDecrescente, function(a, b) return ordem(tabela, a, b) end)
  
  return tabelaOrdemDecrescente
end

contaPalavras.contarPalavrasRepetidas = function (arquivo)
  if not arquivo then
    print("Nao foi possivel abrir arquivo:")
    return nil
  end
  
  local contapal = {}
  string.gsub(arquivo,"%a+",
         function (s)
           if #s > 4 then
             s = string.lower(s)
             contapal[s] = (contapal[s] or 0) + 1
           end
          end)

  local pals = {}

  for p, n in pairs(contapal) do
    pals[#pals+1] = p
  end
  
  return ordenarTabela(contapal, function(tabela, a, b) return tabela[b] < tabela[a] end)
end

return contaPalavras
--local arq = io.open("C:\\Users\\lucag\\source\\repos\\luca16s\\INF1031\\LAB8\\texto.txt","r")
--local b = ContarPalavrasRepetidas(arq)