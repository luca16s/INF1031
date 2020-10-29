local contaPalavras = {}
function ordenarTabela(tabela, ordem)
  local tabelaOrdemDecrescente = {}
  
  for k, v in pairs(tabela) do
    tabelaOrdemDecrescente[#tabelaOrdemDecrescente+1] = { palavra = k,  quantidade = v }
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
  
  return ordenarTabela(contapal, function(tabela, a, b) return tabela[b.palavra] < tabela[a.palavra] end)
end

contaPalavras.mostraQuantidadeEncontrada = function (posicaoEixoX, posicaoEixoY, palavra)
  for i=1, 10 do
    local area = palavra[i].comprimento * palavra[i].largura
    
    if posicaoEixoX <= palavra[i].x + palavra[i].comprimento and posicaoEixoY <= palavra[i].y + palavra[i].largura then
      return "A palavra: " .. palavra[i].texto[i].palavra .. " foi repetida: " .. palavra[i].texto[i].quantidade .. " vezes."
    end
  end
end

return contaPalavras