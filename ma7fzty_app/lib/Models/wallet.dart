// ignore_for_file: body_might_complete_normally_nullable, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    //print("iamin");
    CollectionReference wa = FirebaseFirestore.instance.collection('Wallet');
    //print(amount);
    //print(phoneNumber);
    wa.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // print(doc["ownerPhoneNo"] +
        //    doc["ownerEmail"] +
        //    doc["moneyAmount"].toString());
        // print("ok");
        if (phoneNumber == doc["ownerPhoneNo"] && email == doc["ownerEmail"]) {
          // print("updated");

          _moneyAmount = double.parse(doc["moneyAmount"].toString());
          // print(_moneyAmount);
          _moneyAmount = (_moneyAmount + amount);
          _moneyAmount.toStringAsFixed(2);
          // print(_moneyAmount);

          wa.doc(doc.id).update({'moneyAmount': _moneyAmount});
        } else {
          // print("not found");
        }
      });
    });
  }

  Future<String?> openWallet(
      String email, String phoneNo, double amount) async {
    DocumentReference ref = FirebaseFirestore.instance
        .collection("Wallet")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Owners')
        .doc(phoneNo);
    ref.set(
        {'ownerAmount': amount});
    return 'Done';
  }

  Future<String?> updateWallet(
      String email, String phoneNo, double amount) async {
    DocumentReference ref = FirebaseFirestore.instance
        .collection("Wallet")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Owners')
        .doc(email);
    if (ref.id == email) {
      ref.update({
        'ownerEmail': email,
        'ownerphoneNo': phoneNo,
        'ownerAmount': amount
      });
      return 'Done';
    }
  }

  Future<String?> removeWallet(String email, String phoneNumber) async {
    if (FirebaseFirestore.instance
            .collection('Wallet')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Owners')
            .doc(email)
            .id ==
        email) {
      FirebaseFirestore.instance
          .collection('Wallet')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Owners')
          .doc(email)
          .delete();
      return 'Done';
    } else {
      return 'Error';
    }
  }
}
