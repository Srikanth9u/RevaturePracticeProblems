# Please write a program which accepts a string from console and print the characters that have even indexes.
# Example: If the following string is given as input to the program:
# Plain Text
# H1e2l3l4o5w6o7r8l9d
 
# Then, the output of the program should be:
# Plain Text
# Helloworld

s = "H1e2l3l4o5w6o7r8l9d"
ans = ""
for i in range(0,len(s),2):
    ans += s[i]
print(ans)