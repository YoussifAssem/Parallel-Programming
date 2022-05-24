// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, no_logic_in_create_state, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:ma7fzty_app/webui/menu.dart';

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Chat();
  }
}

class _Chat extends State<Chat> {
  final message = TextEditingController();
  late String messageText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(247, 42, 42, 42),
        title: const Text(
          'Name From DB',
        ),
        actions: [
          Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
            height: 50,
            width: 50,
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.centerRight,
            child: Text(
              FirebaseAuth.instance.currentUser!.email.toString(),
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            messagestreambulder(
              user: 'Read Data From FireBase',
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: message,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        fillColor: Colors.green,
                        hintText: 'Write your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('Chatting').add({
                        'Message': message.text,
                        'Sender':
                            FirebaseAuth.instance.currentUser!.email.toString(),
                        'Receiver': 'Send Receiver Title',
                        'Time':
                            FieldValue.serverTimestamp(), //to arrange messages
                      });
                      message.clear(); //to clear text feild
                    },
                    child: const Text(
                      'send',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 81, 15),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class messagestreambulder extends StatelessWidget {
  late String _user;
  messagestreambulder({required String user}) {
    _user = user;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Chatting')
          .orderBy('Time')
          .snapshots(), //oreder by to arrange massages
      builder: (context, snapshot) {
        List<messageline> messagewidgets = [];

        if (!snapshot.hasData) {
          return const Center(
              child: Text(
            'No Content',
            style: TextStyle(color: Colors.white),
          ));
        } else {
          final messages = snapshot.data!.docs.reversed;
          for (var message in messages) {
            if (message.get('Receiver') ==
                    FirebaseAuth.instance.currentUser!.email.toString() &&
                message.get('Sender') == _user) {
              final messagewidget = messageline(
                sender: message.get('Sender'),
                text: message.get('Message'),
                receiver: FirebaseAuth.instance.currentUser!.email,
                isme: FirebaseAuth.instance.currentUser!.email ==
                    message.get('Sender'), // short if stament
              );
              messagewidgets.add(messagewidget);
            }
            if (message.get('Sender') ==
                    FirebaseAuth.instance.currentUser!.email.toString() &&
                message.get('Receiver') == _user) {
              final messagewidget = messageline(
                sender: message.get('Sender'),
                text: message.get('Message'),
                receiver: FirebaseAuth.instance.currentUser!.email,
                isme: FirebaseAuth.instance.currentUser!.email ==
                    message.get('Sender'), // short if stament
              );
              messagewidgets.add(messagewidget);
            }
          }

          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: messagewidgets,
            ),
          );
        }
      },
    );
  }
}

class messageline extends StatelessWidget {
  messageline(
      {this.text, this.sender, this.receiver, required this.isme, Key? key})
      : super(key: key);

  String? text;
  String? sender;
  String? receiver;

  final bool isme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment:
              isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              '$sender',
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
            Material(
              elevation: 5,
              borderRadius: isme
                  ? const BorderRadius.only(
                      //check the user to change the message color when typing
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
              color: isme
                  ? Colors.blue[800]
                  : Colors
                      .blue[800], //check the user to change the message color
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text('$text',
                    style: TextStyle(
                        fontSize: 15,
                        color: isme
                            ? Colors.white
                            : Colors
                                .white)), //check the user to change the text color
              ),
            ),
          ]),
    );
  }
}
