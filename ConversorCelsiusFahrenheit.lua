print("Digite uma temperatura em Celsius: ")
celsius = io.read("*n")
fahrenheit = 1.8 * celsius + 32
print(string.format("O valor em Fahrenheit: %s", fahrenheit))