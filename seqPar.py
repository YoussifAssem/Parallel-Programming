import threading
import time
class User:
    __amount = 0
    __name = ''
    def __init__(self, name):
        self.__name = name
    def myAmount(self, amount):
        self.__amount = amount
    def getAmount(self):
        return self.__amount
    def getName(self):
        return self.__name        

def transferMoneySequential(user1, user2, amount):
        if(user1.getAmount() > amount):
            user1.myAmount(user1.getAmount() - amount)
            user2.myAmount(user2.getAmount() + amount)
        else:
            print('Error In Amount')     


def transferMoneyParallel(user1, user2, amount, add, remove):
        if(user1.getAmount() > amount):
           with remove: 
            user1.myAmount(user1.getAmount() - amount)
           with add: 
            user2.myAmount(user2.getAmount() + amount)
        else:
            print('Error In Amount')     



if __name__ == '__main__':
    user1 = User('User 1')
    user2 = User('User 2')
    user3 = User('User 3')
    
    user1.myAmount(1000)
    user2.myAmount(900)
    user3.myAmount(500)

    
    
    startSequential = time.perf_counter()
    transferMoneySequential(user1, user2, 200)
    transferMoneySequential(user2, user3, 100)
    transferMoneySequential(user3, user1, 300)
    endSequential = time.perf_counter()
    sequential = (endSequential - startSequential)
    
    
    print('Duration Time of Running Sequential {}'.format(sequential))
    print('{} Amount After Transfer: {}'.format(user1.getName(), user1.getAmount()))
    print('{} Amount After Transfer: {}'.format(user2.getName(), user2.getAmount()))
    print('{} Amount After Transfer: {}'.format(user3.getName(), user3.getAmount()))
    
    
    #PARALLELE WORK
    add = threading.Lock()
    remove = threading.Lock()
    startTime = time.perf_counter()
    threading.Thread(target=transferMoneyParallel, args=(user1, user2, 200, add, remove)).start()
    threading.Thread(target=transferMoneyParallel, args=(user2, user3, 100, add, remove)).start()
    threading.Thread(target= transferMoneyParallel, args=(user3, user1, 300, add, remove)).start()
    endTime = time.perf_counter()
    parallel = (endTime - startTime)
    print('\nDuration Time of Running Parallel {}'.format(parallel))
    print('{} Amount After Transfer: {}'.format(user1.getName(), user1.getAmount()))
    print('{} Amount After Transfer: {}'.format(user2.getName(), user2.getAmount()))
    print('{} Amount After Transfer: {}'.format(user3.getName(), user3.getAmount()))
    
    print('\nSpeedup: {:.2f}%'.format(100*(sequential/parallel)))
    print('Efficiency: {:.2f}%'.format(100*(sequential/parallel)/3))
    
    
