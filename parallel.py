from glob import glob
import json
from flask import Flask, request, jsonify


response = {}

app = Flask(__name__)

@app.route('/transferMoney', methods= ['GET', 'POST'])
def transferMoney():
    global response

    if(request.method == 'POST'):
       data = json.loads(request.data.decode('utf-8'))
       print(data) 
       response = {'phoneNumber': data["phoneNumber"], 'Amount':data["Amount"]}
       return ' ' 
    else:
        return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
