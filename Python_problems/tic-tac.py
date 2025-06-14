def tic_tac_toe(pos1, pos2):
    win_pos = [
        {0, 1, 2}, {3, 4, 5}, {6, 7, 8}, 
        {0, 3, 6}, {1, 4, 7}, {2, 5, 8}, 
        {0, 4, 8}, {2, 4, 6}              
    ]
    m = {pos1, pos2}
    for l in win_pos:
        if m.issubset(l):
            third = l- m
            return third.pop()
    return None
print(tic_tac_toe(0, 6))  