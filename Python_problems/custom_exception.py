class negativeError(Exception):
    def __init__(self, marks):
        self.marks = marks
        self.message = f"you are failed: {self.marks} due to less than 45"
        super().__init__(self.message)
    def __str__(self):
        return self.message

def validate_marks(marks):
    if marks < 45:
        raise negativeError(marks)
    else:
        print("you are passed:", marks)

try:
    validate_marks(5)
except negativeError as e:
    print(e)