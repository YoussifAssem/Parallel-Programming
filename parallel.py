import json
from flask import Flask, request, jsonify
import firebase_admin
from firebase_admin import credentials, firestore
import threading
import sys
import time

class Parallel:
   __db = object()
   def __init__(self):
        try:
                cred = credentials.Certificate("../fireStore.json")
                firebase_admin.initialize_app(cred)
                self.__db = firestore.client()
        except:
            print('Error')
   def addMoney(self, ref, myAmount, money):
       ref.set({
                  'ownerAmount': str(int(myAmount) + int(money))
              })
   def removeMoney(self, ref, myAmount, money):
       ref.set({
                  'ownerAmount': str(int(myAmount) - int(money))
              })
   def runThreading(self, data):
        add = threading.Lock()
        remove = threading.Lock()
        threading.Thread(target=self.transfer, args=(data, add, remove)).start()
       
   def transfer(self, data, add, remove):
       refSender = self.__db.collection('Wallet').document('8B71nVAcOQcoL0FsD6WwDyDV2Mm1').collection('Owners').document(data["senderPhone"])
       refReceiver = self.__db.collection('Wallet').document('8B71nVAcOQcoL0FsD6WwDyDV2Mm1').collection('Owners').document(data["receiverPhone"])
       valSender = refSender.get().to_dict()
       valReceiver = refReceiver.get().to_dict()
       if(refSender.get().exists and refReceiver.get().exists):
          if(int(valSender['ownerAmount']) > int(data['Amount'])):
            a = time.time()  
            with remove:  
              self.removeMoney(refSender, valSender['ownerAmount'], data['Amount'])
            with add:  
              self.addMoney(refReceiver, valReceiver['ownerAmount'], data['Amount'])
            b = time.time()
            print('Parallel Time: ', b-a)  
          else:
              sys.exit('Error Program Is Terminated')   
response = {}
app = Flask(__name__)
@app.route('/transferMoney', methods= ['GET', 'POST'])
def transferMoney():
    global response
    parallelRun = Parallel()
    if(request.method == 'POST'):
       data = json.loads(request.data.decode('utf-8'))
       response = {'senderPhone': data["senderPhone"],'receiverPhone': data["receiverPhone"], 'Amount':data["Amount"]}
       parallelRun.runThreading(data)
       return jsonify(response)
     
    else:
        return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
