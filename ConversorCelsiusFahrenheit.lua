function ConvertParaFahrenheit(temperatura)
    return 1.8 * temperatura + 32;
end

print("Digite uma temperatura em Celsius: ")
local celsius = io.read("*n")
print(string.format("O valor em Fahrenheit: %s", ConvertParaFahrenheit(celsius)))