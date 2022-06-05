import 'package:ma7fzty_app/Models/wallet.dart';
import 'package:ma7fzty_app/Models/user.dart';



class Admin extends User {
  Wallet wallet = Wallet();
  Admin();
  
  Future<String?> openWallet(
      String email, String phoneNo, double amount) async {
        
    if (await wallet.openWallet(email, phoneNo, amount) == 'Done') {
      return 'Done';
    } else {
      return 'Error';
    }
  }

  Future<String?> removeWallet(String email, String phoneNo) async {
    if (await wallet.removeWallet(email, phoneNo) == 'Done') {
      return 'Done';
    } else {
      return 'Error';
    }
  }

  Future<void> addMoney(String email, String phoneNumber, double amount) async {
    wallet.addMoney(email, phoneNumber, amount);
  }
}
