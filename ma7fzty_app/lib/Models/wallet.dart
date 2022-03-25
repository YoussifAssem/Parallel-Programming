import 'package:cloud_firestore/cloud_firestore.dart';

class Wallet {
  late String _ownerPhoneNo;
  late double _moneyAmount;

  Wallet();

  setPhoneNo(String number) {
    _ownerPhoneNo = number;
  }

  getPhoneNo() {
    return _ownerPhoneNo;
  }

  setAmount(double amount) {
    _moneyAmount = amount;
  }

  getAmount() {
    return _moneyAmount;
  }

  Future<void> addMoney(String phoneNumber, double amount) async {
    print("iamin");
    CollectionReference wa = FirebaseFirestore.instance.collection('Wallet');
    print(amount);
    print(phoneNumber);
    wa.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print("ok");
        if (phoneNumber == doc["ownerPhoneNo"]) {
          print("updated");

          _moneyAmount = double.parse(doc["Amount"].toString());
          print(_moneyAmount);
          _moneyAmount = (_moneyAmount + amount);
          _moneyAmount.toStringAsFixed(2);
          print(_moneyAmount);

          wa.doc(doc.id).update({'Amount': _moneyAmount});
        } else {
          print("not found");
        }
      });
    });
  }
}
