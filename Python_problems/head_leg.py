# Write a program to solve a classic ancient Chinese puzzle: We count 35 heads and 94 legs among the chickens and rabbits in a farm. How many rabbits and how many chickens do we have?
# Hints
# Use for loop to iterate all possible solutions.

h = 35
l = 94

for i in range(h):
    eq = 2 * i + 4* (h - i)
    if eq == l:
        print(i, h-i)