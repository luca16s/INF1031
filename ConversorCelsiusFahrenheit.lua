function ConverteParaFahrenheit(temperatura)
    return 1.8 * temperatura + 32;
end

function ConverteParaCelsius(temperatura)
    return (temperatura - 32) / 1.8 ;
end

function EstaComFebre(temperatura)
 return temperatura >= 98.6;
end

print("Digite uma temperatura em Celsius: ")
local celsius = io.read("*n")
print(string.format("O valor em Fahrenheit: %s", ConverteParaFahrenheit(celsius)))
print(string.format("Está com febre: %s", EstaComFebre(ConverteParaFahrenheit(celsius))))
print("Digite uma temperatura em Fahrenheit: ")
local fahrenheit = io.read("*n")
print(string.format("O valor em Celsius: %s", ConverteParaCelsius(fahrenheit)))
print(string.format("Está com febre: %s", EstaComFebre(ConverteParaCelsius(fahrenheit))))