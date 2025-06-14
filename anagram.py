def anagram_check(list):
    n=len(list)
    m=[]
    if n <2:
        return False
    for i in range(n):
        for j in range(i+1, n):
            if sorted(list[i]) == sorted(list[j]):
                m.append((list[i], list[j]))
    return m

list =["eat", "tea", "tan", "ate", "nat", "bat"]
print(anagram_check(list))