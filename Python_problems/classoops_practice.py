# abstract method
from abc import abstractmethod, ABC

class Car(ABC):
    def __init__(self, car):
        self.car = car
    @abstractmethod
    def start(self):
        pass
   
    @abstractmethod
    def stop(self):
        pass
class Bike(Car):
    def start(self):
        print(f" it is starting" + self.car)
    def stop(self):
        print(f" it is stoping" + self.car)

car = Bike("cbz")
car.start()  # Output: Starting the car engine.
car.stop()  # Output: Stopping the car engine.

# inheritance



