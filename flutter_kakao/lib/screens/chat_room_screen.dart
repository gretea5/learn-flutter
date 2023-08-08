import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/chat_icon_button.dart';
import 'package:flutter_kakao/components/my_chat.dart';
import 'package:flutter_kakao/components/other_chat.dart';
import 'package:flutter_kakao/components/time_line.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<MyChat> chats = [];
  FocusNode? myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(
          0xFFb2c7da,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(context),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        const TimeLine(time: "2021년 1월 1일 금요일"),
                        const OtherChat(
                          name: "홍길동",
                          text: "새해 복 많이 받으세요",
                          time: "오전 10:10",
                        ),
                        const MyChat(
                          text: "선생님도 많이 받으십시오.",
                          time: "오후 2:15",
                        ),
                        ...List.generate(
                          chats.length,
                          (index) => chats[index],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                color: Colors.white,
                child: Row(
                  children: [
                    const ChatIconButton(
                      icon: Icon(
                        FontAwesomeIcons.squarePlus,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: myFocusNode,
                        controller: _textController,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onSubmitted: _handleSubmitted,
                      ),
                    ),
                    const ChatIconButton(
                      icon: Icon(
                        FontAwesomeIcons.faceSmile,
                      ),
                    ),
                    const ChatIconButton(
                      icon: Icon(
                        FontAwesomeIcons.gear,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmitted(value) {
    print(value);
    _textController.clear();
    setState(() {
      final currentTime = DateFormat('a k:m')
          .format(DateTime.now())
          .replaceAll("AM", "오전")
          .replaceAll("PM", "오후");
      chats.add(
        MyChat(text: value, time: currentTime),
      );
    });

    myFocusNode!.requestFocus();
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        "홍길동",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: const [
        Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 20,
        ),
        SizedBox(width: 25),
        Icon(
          FontAwesomeIcons.bars,
          size: 20,
        ),
        SizedBox(width: 25),
      ],
    );
  }
}
