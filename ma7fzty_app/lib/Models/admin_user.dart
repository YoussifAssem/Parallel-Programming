import 'package:ma7fzty_app/Models/wallet.dart';
import 'package:ma7fzty_app/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin extends User {
  Wallet wallet = Wallet();
  Admin();

  Future<void> openWallet(String email, String phoneNo, double amount) async {
    wallet.openWallet(email, phoneNo, amount);
  }

  Future<void> removeWallet(String id) async {
    wallet.removeWallet(id);
  }

  Future<void> addMoney(String phoneNumber, String email, double amount) async {
    wallet.addMoney(phoneNumber, email, amount);
  }
}
