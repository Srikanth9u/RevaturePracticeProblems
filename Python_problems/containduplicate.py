# Create a function in Python that accepts one parameter: 
# a string that’s a sentence. This function should return 
# True if any word in that sentence contains duplicate letters and False if not.

def dup(s):
    k = set(s)
    if len(s) == len(k):
        return False
    return True
s = input()
print(dup(s))