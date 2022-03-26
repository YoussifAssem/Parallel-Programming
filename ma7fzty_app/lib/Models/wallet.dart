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

  Future<void> addMoney(String email, String phoneNumber, double amount) async {
    print("iamin");
    CollectionReference wa = FirebaseFirestore.instance.collection('Wallet');
    print(amount);
    print(phoneNumber);
    wa.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["ownerPhoneNo"] +
            doc["ownerEmail"] +
            doc["moneyAmount"].toString());
        print("ok");
        if (phoneNumber == doc["ownerPhoneNo"] && email == doc["ownerEmail"]) {
          print("updated");

          _moneyAmount = double.parse(doc["moneyAmount"].toString());
          print(_moneyAmount);
          _moneyAmount = (_moneyAmount + amount);
          _moneyAmount.toStringAsFixed(2);
          print(_moneyAmount);

          wa.doc(doc.id).update({'moneyAmount': _moneyAmount});
        } else {
          print("not found");
        }
      });
    });
  }

  Future<void> openWallet(String email, String phoneNo, double amount) async {
    CollectionReference wa = FirebaseFirestore.instance.collection('Wallet');

    return wa
        .doc()
        .set({
          'ownerEmail': email,
          'ownerphoneNo': phoneNo,
          'moneyAmount': amount,
        })
        .then((value) => print("wallet Added"))
        .catchError((error) => print("Failed to add wallet: $error"));
  }

  Future<void> removeWallet(String email, String phoneNumber) async {
    CollectionReference w = FirebaseFirestore.instance.collection('Wallet');
    w.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (email == doc["ownerEmail"] && phoneNumber == doc["ownerPhoneNo"]) {
          w
              .doc(doc.id)
              .delete()
              .then((value) => print("wallet Deleted"))
              .catchError((error) => print("Failed to delete wallet: $error"));
        } else
          print("not found");
      });
    });
  }
}
