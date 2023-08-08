import 'package:flutter/material.dart';
import 'package:flutter_kakao/models/chat.dart';
import 'package:flutter_kakao/screens/chat_room_screen.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;

  const ChatCard({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("클릭함");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatRoomScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(chat.image),
                ),
                title: Text(
                  chat.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(chat.content),
              ),
            ),
            Column(
              children: [
                Text(
                  chat.time,
                  style: const TextStyle(
                    color: Color(0xFFa5a5a5),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                chat.count != "0"
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFFde6344),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          chat.count,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
