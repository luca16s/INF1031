--0,1,1,2,3,5 
function Fibonacci(numeroEscolhido)
  if numeroEscolhido == 0 then
    return 0
  end
  if numeroEscolhido == 1 then
    return 1
  end
  if numeroEscolhido == 2 then
    return 1
  else
    print(numeroEscolhido)
    return(Fibonacci(numeroEscolhido - 1) + Fibonacci(numeroEscolhido - 2))
  end
end

print(Fibonacci(5))