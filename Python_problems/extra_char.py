def extra_char(str1, str2):
    # extra = []
    for ch in str2:
        if ch not in str1:
            return ch
    


# str1 = input("Enter first string: ")
# str2 = input("Enter second string: ")
str1="eueiieo"
str2="iieoedue"
print(extra_char(str1, str2))
