import 'package:chat_ex01/chatting/chat/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final chatDocs = snapshot.data!.docs;
          return ListView.builder(
              itemCount: chatDocs.length,
              reverse: true,
              itemBuilder: (context, i) {
                return ChatBubble(chatDocs[i]['text'],
                    chatDocs[i]['userId'].toString() == user!.uid);
              });
        });
  }
}
