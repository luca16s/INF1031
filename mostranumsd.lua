function mostranumsd(num)
  if num > 0 then
    mostranumsd(num-1)
    print (num)
  end
end

print ("entre com o número:")
mostranumsd(io.read("*n"))