# For the purpose of this challenge, shadow sentences are sentences 
# where every word is the same length and order but without any of the same letters. 
# Write a function that accepts two parameters that may or may not be shadows of each other. 
# The function should return True if they are and False if they aren’t.
# An example would be “they are round” and “fold two times,” which are shadow sentences, 
# while “his friends” and “our company” are not because both contain an r.

s1 = "they are round"
s2 = "fold two times"
def shadow(s1,s2):
    a1 = s1.split(" ")
    a2 = s2.split(" ")
    if len(a1) != len(a2):
       return False
    else:
        for i in range(len(a1)):
           if len(a1[i]) != len(a2[i]):
               return False
        return True
print(shadow(s1,s2))

