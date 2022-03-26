import 'package:ma7fzty_app/Models/wallet.dart';
import 'package:ma7fzty_app/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin extends User {
  Wallet wallet = Wallet();
  Admin();

  Future<void> openWallet(String email, String phoneNo, double amount) async {
    wallet.openWallet(email, phoneNo, amount);
  }

  Future<void> removeWallet(String email, String phoneNo) async {
    wallet.removeWallet(email, phoneNo);
  }

  Future<void> addMoney(String email, String phoneNumber, double amount) async {
    wallet.addMoney(email, phoneNumber, amount);
  }
}
