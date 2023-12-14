import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final textController = TextEditingController();
  var message = '';
  final user = FirebaseAuth.instance.currentUser;

  void sendMessage() async {
    FocusScope.of(context).unfocus();
    final userData = await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': message,
      'time': Timestamp.now(),
      'userId': user!.uid,
      'userName': userData.data()!['userName']
    });
    // textController.text = '';
    textController.clear(); // 자판도 사라지게 함
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
                  controller: textController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Send a message...',
                  ),
                  onChanged: (value) {
                    setState(() {
                      message = value;
                    });
                  })),
          IconButton(
              icon: const Icon(Icons.send),
              color: Colors.green,
              onPressed: message.trim().isEmpty ? null : sendMessage),
        ],
      ),
    );
  }
}
