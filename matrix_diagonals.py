def diagonals_add(matrix):
    n = len(matrix)
    list = []

    for i in range(n):
        list.append(matrix[i][i])          
        list.append(matrix[i][n - i - 1])     
    new = set(list)
    return sum(new)
matrix = [[1, 2, 3],[4, 5, 6],[7, 8, 9]]
print(diagonals_add(matrix))
