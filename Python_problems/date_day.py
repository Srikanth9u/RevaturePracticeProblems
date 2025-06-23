def date_day(date):
    ls= date.split("-")
    day=ls[1]/7
    ls2=["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    for i in range(0, len(ls2)):
        
            return ls2[i]
        

# Example usage
date = "2023-10-05"