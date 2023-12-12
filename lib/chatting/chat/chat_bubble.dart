import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  const ChatBubble(this.message, this.isMe, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            // border:Border.all(width:1, color:Colors.grey),
            borderRadius: BorderRadius.only(
              topRight: const Radius.circular(12),
              topLeft: const Radius.circular(12),
              bottomRight:
                  isMe ? const Radius.circular(0) : const Radius.circular(12),
              bottomLeft:
                  isMe ? const Radius.circular(12) : const Radius.circular(0),
            ),
            color: isMe ? Colors.green : Colors.yellow,
          ),
          width: 220,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            message,
            style: TextStyle(
                fontSize: 20, color: isMe ? Colors.black : Colors.blue[900]),
          ),
        ),
      ],
    );
  }
}
