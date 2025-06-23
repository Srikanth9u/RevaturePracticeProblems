# For this challenge, you need to write a function in Python that accepts a string of ASCII characters.
# It should return each character’s value as a hexadecimal string. Separate each byte by a space,
# and return all alpha hexadecimal characters as lowercase.

def ascii_to_hex(input_str):
    return ' '.join(format(ord(char), ' ') for char in input_str)
print(ascii_to_hex("Aa"))
