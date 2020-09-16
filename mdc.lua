function mdc (n1, n2) 
  local resto = n1%n2
  if resto == 0 then
    return n2
  else
    local div = mdc (n2, resto)
    print ("resto aqui era: ".. resto)
    return div
  end
end

print ("entre com dois numeros: ")
a, b = io.read ("*n", "*n")
print (mdc(a, b))