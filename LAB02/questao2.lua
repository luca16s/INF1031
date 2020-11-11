function RetornaDelta(a, b, c)
    return (b^2)-4*a*c;
end

function Raizes(a, b, c)
    local raizDelta = math.sqrt(RetornaDelta(a, b, c))
    
    if raizDelta >= 0 then
      local raizPositiva = (-b+raizDelta)/(2*a)
      local raizNegativa = (-b-raizDelta)/(2*a)
      
      return raizPositiva, raizNegativa
    end
end

function MontaMensagem(r1, r2)
  local mensagem = ''
  if r1 ~= nil and r1 > 0 then
    mensagem = mensagem .. string.format("Raíz 1: %s", r1) .. " e "
  end
  if r2 ~= nil and r2 > 0 then
    mensagem = mensagem .. string.format("Raíz 2: %s", r2)
  end
  if r1 == nill and r2 == nil then
    return nil
  end
  return mensagem
end

print("Insira o valor do parametro para a:")
local a = io.read("*n")
print("Insira o valor do parametro para b:")
local b = io.read("*n")
print("Insira o valor do parametro para c:")
local c = io.read("*n")

print(string.format("%s", MontaMensagem(Raizes(a, b, c))))