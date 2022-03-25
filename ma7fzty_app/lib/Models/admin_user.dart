import 'package:ma7fzty_app/Models/wallet.dart';
import 'package:ma7fzty_app/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin extends User {
  late Wallet wallet;
  Admin();

  Future<void> openWallet(String email, String phoneNo, double amount) async {
    CollectionReference wa = FirebaseFirestore.instance.collection('Wallet');

    return wa
        .doc()
        .set({
          'email': email,
          'ownerphoneNo': phoneNo,
          'Amount': amount,
        })
        .then((value) => print("wallet Added"))
        .catchError((error) => print("Failed to add wallet: $error"));
  }

  Future<void> removeWallet(String id) async {
    CollectionReference w = FirebaseFirestore.instance.collection('Wallet');
    w.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (id == doc.id.toString()) {
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
