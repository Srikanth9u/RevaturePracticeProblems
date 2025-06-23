# Given 2 sets of integers, M and N, print their symmetric difference in ascending order. The term symmetric difference indicates those values that exist in either M or N but do not exist in both.
# Input
# The first line of input contains an integer, M.The second line contains M space-separated integers.The third line contains an integer, N.The fourth line contains N space-separated integers.

# 4
# 2 4 5 9
# 4
# 2 4 11 12
 
# Output
# Output the symmetric difference integers in ascending order, one per line.

# 5
# 9
# 11
# 12
 
# Hints
# Use '^' to make symmetric difference operation.

n = int(input())
ar1 = list(map(int, input().split()))


m = int(input())
ar2 = list(map(int, input().split()))
ar1.extend(ar2)
ans = []
for i in ar1:
    if ar1.count(i) > 1:
        continue
    else:
        ans.append(i)
print(ans)
 