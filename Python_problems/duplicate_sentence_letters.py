def duplicate_letters(sentence):
    words = sentence.split()

    for word in words:
        letters = [char for char in word if char.isalpha()]
        if len(letters) != len(set(letters)):
            return True  

    return False 
str="This sentence has bubbles"
print(duplicate_letters(str))