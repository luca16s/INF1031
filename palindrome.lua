-- Palíndrome Ex: ANA
function palindrome(palavra)
    local len = string.len(palavra)
    if len == 0 then
      return true
    else
      local tamanhoPalavra = string.len(palavra)
      return string.sub(palavra, 1, 1) == string.sub(palavra, tamanhoPalavra, tamanhoPalavra)
    end
  end

  local st = io.read("*l")
  if palindrome (st) then print ("palindrome")
  else print ("não é palíndrome")
  end