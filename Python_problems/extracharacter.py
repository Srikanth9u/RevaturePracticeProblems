# Write a function in Python that accepts two string parameters. 
# The first parameter will be a string of characters, and 
# the second parameter will be the same string of characters, 
# but they’ll be in a different order and have one extra character. 
# The function should return that extra character.
# For example, if the first parameter is “eueiieo” and the second is “iieoedue,” 
# then the function should return “d.”

s1 = "eueiieo"
s2 = "iieoedue"
for i in s2:
    if i not in s1:
        print(i)
        break
    else:
        continue