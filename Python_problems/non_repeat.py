s = "abcabcbb"
max_l = 0
for i in range(len(s)):

    si = s[i]
    for j in range(i+1,len(s)):
        if s[j] not in si:
            si += s[j]
        else:
            break
    if max_l < len(si):
        max_l = len(si)
print(max_l)
