# Python program to create Bankaccount class
# with both a deposit() and a withdraw() function
class Bank_Account:
    def __init__(self):
        self.balance=0
        print("Hello!!! Welcome to the Deposit & Withdrawal Machine")
 
    def deposit(self):
        amount=float(input("Enter amount to be Deposited: "))
        self.balance += amount
        print("\n Amount Deposited:",amount)
 
    def withdraw(self):
        amount = float(input("Enter amount to be Withdrawn: "))
        if self.balance>=amount:
            self.balance-=amount
            print("\n You Withdrew:", amount)
        else:
            print("\n Insufficient balance  ")
 
    def display(self):
        print("\n Net Available Balance=",self.balance)

    def transfer(self, amount):
      self.balance = self.balance - amount 
      self.balance = self.balance + amount 
      return self.balance()    
 
# Driver code
  
# creating an object of class
s1 = Bank_Account()
s2=Bank_Account()
s1.transfer(50,s2)

""""
# Calling functions with that class object
s1.deposit()
s1.withdraw()
s1.display()
"""