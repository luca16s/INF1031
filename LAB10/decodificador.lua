Decodificador = {}

function Decodificador.buscaPalavraChaveMensagem(mensagemRecebida)
  return string.match(mensagemRecebida, "<%a+>")
end

function Decodificador.decodificarCoordenadas(mensagemRecebida)
    local coordenadaDecodificada = {}
    local contador = 0
    string.gsub(mensagemRecebida,"<%d+>", function(coordenada)
        coordenadaDecodificada[contador] = string.gsub(coordenada, "%p+", "")
        contador = contador + 1
    end)
  return coordenadaDecodificada[0], coordenadaDecodificada[1], string.match(mensagemRecebida, '%a+[%a-%d+]*')
end

function Decodificador.dadosJogador(mensagemRecebida)
  return string.match(mensagemRecebida, '%w[%w.-]*')
end

function Decodificador.semente(mensagemRecebida)
  return string.sub(string.match(mensagemRecebida, '<%w[%w.]*>'), 2, -2)
end

function Decodificador.decodificarPontuacao(mensagemRecebida)
  local jogador =  string.match(mensagemRecebida, '%w[%w.-]*')
  local pontuacao = string.sub(string.match(mensagemRecebida, '<%d[%d.,]*>'), 2, -2)
  return jogador, pontuacao
end

return Decodificador