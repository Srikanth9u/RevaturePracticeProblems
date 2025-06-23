# In this Python challenge, you need to write a function that accepts an encoded string as a parameter. This string will contain a first name, last name, and an id.
# Values in the string can be separated by any number of zeros. The id is a numeric value but will contain no zeros. The function should parse the string and return a Python dictionary that contains the first name, last name, and id values.
# An example input would be “Robert000Smith000123”. The function should return the following using that input:
# { “first_name”: “Robert”, “last_name”: “Smith”, “id”: “123” }

str = "Robert000Smith000123"
k = str.split("000")
ans ={'first_name': k[0], 'last_name': k[1], 'id': k[2] }
print(ans)
