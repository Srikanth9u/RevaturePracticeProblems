
lis = ["eat", "tea", "tan", "ate", "nat", "bat"]
used = [False] * len(lis)
ans = []
for i in range(len(lis)):
    if not used[i]:
        group = [lis[i]]
        used[i] = True
        for j in range(i + 1,len(lis)):
            if sorted(lis[j]) == sorted(lis[i]):
                group.append(lis[j])
                used[j] = True
        ans.append(group)
print(ans)
