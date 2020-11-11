math.randomseed (os.time())

function PerguntaQuestoes()
  operando1 = math.random (12)
  operando2 = math.random (12)
  local acertou = false

  while acertou ~= true do
      print(string.format("calcule %d x %d: ", operando1, operando2))
      local result = io.read ("*n")
      if result then
        acertou = result == operando1 * operando2
        if acertou then
          print("muito bem!")
        else
          print("vamos estudar mais um pouco")
        end
      else
        print("tem que ser um numero!")
        local lixo = io.read("l")
      end
  end
end

for i=1, 5 do PerguntaQuestoes() end