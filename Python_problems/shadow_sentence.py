def isShadowSentence(str1, str2):
    word1 = str1.lower().split()
    word2 = str2.lower().split()
    if len(word1) != len(word2):
        return False
    for w1, w2 in zip(word1, word2):
        if len(w1) != len(w2):
            return False
        if set(w1) & set(w2):  
            return False   
        
    return True

str1 = input("")
str2 = input("")

print(isShadowSentence(str1, str2))