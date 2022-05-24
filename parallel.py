import json
from flask import Flask, request, jsonify
import threading

import firebase_admin
from firebase_admin import credentials, firestore

response = {}
#transfer = threading.lock()
class Connection:
   __db = object()  
   def __init__(self):
        try:
                cred = credentials.Certificate("../fireStore.json")
                firebase_admin.initialize_app(cred)
                self.__db = firestore.client()
        except:
            print('Error')
   def transfer(self, data):
       refSender = self.__db.collection('Wallet').document('8B71nVAcOQcoL0FsD6WwDyDV2Mm1').collection('Owners').document(data["senderPhone"])
       refReceiver = self.__db.collection('Wallet').document('8B71nVAcOQcoL0FsD6WwDyDV2Mm1').collection('Owners').document(data["receiverPhone"])
       valSender = refSender.get().to_dict()
       valReceiver = refReceiver.get().to_dict()
       if(refSender.get().exists and refReceiver.get().exists):
          if(int(valSender['ownerAmount']) > int(data['Amount'])):
              refSender.set({
                  'ownerAmount': str(int(valSender['ownerAmount']) - int(data['Amount']))
              })
              refReceiver.set({
                  'ownerAmount': str(int(valReceiver['ownerAmount']) + int(data['Amount']))
              })
              return 'Transfered'    
          else:
              return 'Error'   
app = Flask(__name__)
@app.route('/transferMoney', methods= ['GET', 'POST'])
def transferMoney():
    global response
    conn = Connection()
    print(request.method)
    if(request.method == 'POST'):
       data = json.loads(request.data.decode('utf-8'))
       response = {'senderPhone': data["senderPhone"],'receiverPhone': data["receiverPhone"], 'Amount':data["Amount"]}
       if(conn.transfer(data) == 'Transfered'):
            return jsonify(response)
     
    else:
        return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
