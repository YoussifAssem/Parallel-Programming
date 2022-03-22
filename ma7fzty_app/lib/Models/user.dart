// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  // ignore: prefer_final_fields, unused_field
  late String _phoneNumber;
  late String _email;
  late String _password;

  signUp(
      {required String email,
      required String password,
      required String phoneNumber}) async {
    try {
      _setEmail(email);
      _setPassword(password);
      _setPhoneMumber(phoneNumber);
      if (_getEmail() != 'Error' &&
          _getPassword() != 'Error' &&
          _getPhoneNumber() != 'Error') {
        final list =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(_getEmail());
        if (list.isNotEmpty) {
          return 'Error';
        } else {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _getEmail(), password: _getPassword());
          DocumentReference ref = FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid);
          FirebaseFirestore.instance.runTransaction((transaction) async {
            DocumentSnapshot snapShot = await transaction.get(ref);
            if (!snapShot.exists) {
              ref.set({
                'email': _getEmail(),
                'phoneNumber': _getPhoneNumber(),
              });
            }
          });
        }
      } else {
        return 'Error';
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  String get Email {
    return FirebaseAuth.instance.currentUser!.email.toString();
  }

  Future<String?> signOut() async {
    await FirebaseAuth.instance.signOut();
    return '';
  }

  login(String email, String password) async {
    _setEmail(email);
    _setPassword(password);
    if (_getEmail() != 'Error' && _getPassword() != 'Error') {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _getEmail(), password: _getPassword());
        return 'Done';
      } on FirebaseAuthException catch (e) {
        return e.message;
      }
    }
  }

  sendMessage(String email, String message) async {
    try {
      if (email == '' || message == '') {
        return 'Error';
      } else {
        DocumentReference ref = FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Chatting')
            .doc();
        FirebaseFirestore.instance.runTransaction((transaction) async {
          DocumentSnapshot snapShot = await transaction.get(ref);
          if (!snapShot.exists) {
            ref.set({
              'Sender': Email,
              'Receiver': email,
              'Meeage': message,
            });
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  _setEmail(String e) {
    _email = e;
  }

  _getEmail() {
    if (_email == '') {
      return 'Error';
    } else {
      return _email;
    }
  }

  _setPhoneMumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  _getPhoneNumber() {
    if (_phoneNumber == '') {
      return 'Error';
    }
    if (_phoneNumber.length == 11) {
      return _phoneNumber;
    }
  }

  _setPassword(String p) {
    _password = p;
  }

  _getPassword() {
    if (_password == '') {
      return 'Error';
    } else {
      return _password;
    }
  }
}
