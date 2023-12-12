import 'package:chat_ex01/chatting/chat/new_message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../chatting/chat/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat screen'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.exit_to_app_sharp,
                color: Colors.blue,
              ),
              onPressed: () {
                _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
      ),
      body: Container(
        child: const Column(children: [
          Expanded(child: Messages()),
          NewMessage(),
        ]),
      ),
    );
  }
}
