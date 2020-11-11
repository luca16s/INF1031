function mdc(n1, n2) 
  local resto = n1%n2
  if resto == 0 then
        return n2    
  end
  while resto ~= 0 do
      print ("resto aqui era: ".. resto)
      local div = n2%resto
      n2 = resto
      if div == 0 then
        return n2
      end
      resto = div
  end
end

--print ("entre com dois numeros: ")
--a, b = io.read ("*n", "*n")
--print('----------------------------------')
--print(mdc(a, b))

for i=4, 20 do
  for j=4, 20 do
    if i ~= j then
      print("Valor A: "..i)
      print("Valor B: "..j)
      print('----------------------------------')
      print(mdc(i, j))
      print('**********************************')
    end
  end  
end