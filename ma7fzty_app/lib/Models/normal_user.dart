// ignore_for_file: camel_case_types, unused_field, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ma7fzty_app/Models/user.dart';

class normalUser extends User {
  //Object From Wallet
  late double _amount;

  transferMoney({required String phoneNumber, required double amount}) async {
    setPhoneMumber(phoneNumber);
    setAmount(amount);
    if (getPhoneNumber() != 'Error' && _getAmount() != 'Error') {
      Query<Map<String, dynamic>> re = FirebaseFirestore.instance
          .collection('Users')
          .where('phoneNumber', isEqualTo: getPhoneNumber());
      if (re.toString() != '') {
        DocumentReference ref = FirebaseFirestore.instance
            .collection('Users')
            .doc(userID)
            .collection('transferMoney')
            .doc(Email);

        FirebaseFirestore.instance.runTransaction((transaction) async {
          DocumentSnapshot snapShot = await transaction.get(ref);
          if (!snapShot.exists || snapShot.exists) {
            ref.set({
              'phoneNumber': getPhoneNumber(),
              'Amount': _getAmount(),
            });
            return 'Done';
          } else {
            return 'Error';
          }
        });
      } else {
        return 'Error';
      }
    }
  }

  setAmount(double amount) {
    _amount = amount;
  }

  viewAmount(String phoneNumber) {
    setPhoneMumber(phoneNumber);
    if (getPhoneNumber() != 'Error') {
      Query<Map<String, dynamic>> re = FirebaseFirestore.instance
          .collection('Users')
          .where('phoneNumber', isEqualTo: getPhoneNumber());
      if (re.toString() != '') {
        //Return Amount from wallet
      }
    }
  }

  _getAmount() {
    if (_amount == 0) {
      return 'Error';
    } else {
      return _amount;
    }
  }
}
