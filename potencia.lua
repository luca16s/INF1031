function pot (x, k)
  if k == 0 then
    return 1
  else 
    return x*pot(x, k-1)
  end
end

print ("entre com número e expoente:")
local num, exp = io.read ("*n", "*n")
print (pot(num, exp))