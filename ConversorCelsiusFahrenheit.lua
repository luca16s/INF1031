print("Digite uma temperatura em Celsius: ")
local celsius = io.read("*n")
local fahrenheit = 1.8 * celsius + 32
print(string.format("O valor em Fahrenheit: %s", fahrenheit))