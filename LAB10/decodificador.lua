decodificador = {}

function decodificador.decodificaCoordenadas(mensagemRecebida)
    local coordenadaDecodificada = {}
    local contador = 0
  
    string.gsub(mensagemRecebida,"<%d+>", function(coordenada)
        coordenadaDecodificada[contador] = string.gsub(coordenada, "%p+", "")
        contador = contador + 1
    end)
  
  return coordenadaDecodificada[0], coordenadaDecodificada[1]
end

return decodificador