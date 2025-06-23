def string_split(s,n):
    for i in range(0,len(s),n):
        print(s[i:i+n])
    

s = "abcdefghijklmnopqrstuvwxyz"
n = 4
string_split(s, n)

