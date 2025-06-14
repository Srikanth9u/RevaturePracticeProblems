input_str = input("Enter encoded string: ")


parts = input_str.split("000")
if len(parts) != 3:
    print("invalid input")
result = {
    "first_name": parts[0],
    "last_name": parts[1],
    "id": parts[2]
}

print(result)
