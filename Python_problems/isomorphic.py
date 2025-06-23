
# Determine if two strings are isomorphic. Two strings are isomorphic if the characters in one string can be replaced to get the other, with a one-to-one mapping.
 
# Input: "egg", "add" → Output: True  

# Input: "foo", "bar" → Output: False  

# Input: "paper", "title" → Output: True

def isomorphic_pattern(s):
    mapping = {}
    pattern = []

    for i, char in enumerate(s):
        if char not in mapping:
            mapping[char] = i
        pattern.append(mapping[char])

    return pattern

a = input()
b = input()

print(isomorphic_pattern(a) == isomorphic_pattern(b))
