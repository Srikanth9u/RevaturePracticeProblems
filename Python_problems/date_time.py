import datetime

def hasFriday13(month, year):
    date = datetime.date(year, month, 13) #2024-06-13
    return date.weekday() == 4

month = int(input(" "))
year = int(input())   
print(hasFriday13(month, year))