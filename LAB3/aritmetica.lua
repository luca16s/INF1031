function ValidaNumeroGerado(chute, valorEsperado)
    if chute < valorEsperado then
      print(1)
      return
    elseif chute > valorEsperado then
      print(-1)
      return
    elseif chute == valorEsperado then
      print(0)
    end
end

function ValidarTentativa(valorEsperado)
    print("Diga seu chute: ")
    local chute = io.read ("*n")
    ValidaNumeroGerado(chute, valorEsperado)
    return chute == valorEsperado
  end

  function ProcessarTentativas(oportunidadesRestantes, valorEsperado)
    if  oportunidadesRestantes > 0 then
      if ValidarTentativa(valorEsperado) then
        return oportunidadesRestantes
      else
        print ("vamos mais uma vez...")
        return ProcessarTentativas(oportunidadesRestantes - 1, valorEsperado)
      end
    else
      print ("acabaram suas tentativas")
      return 0
    end
  end

  math.randomseed(os.time())
  local restantes = ProcessarTentativas(20, math.random(1, 1024))

  if restantes > 0 then
    print("acertou! parabens!")
  else
    print("não foi dessa vez :-(")
  end