with open("./token", "rb") as file:
    data = file.read().strip()

result = ""
for i, byte in enumerate(data):
    result += chr((byte - i) % 256)

print(result)