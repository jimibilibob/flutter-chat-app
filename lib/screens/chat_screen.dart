import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  final List<ChatMessage> _messages = [];

  bool _isWritting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text(
                'Te',
                style:
                    TextStyle(fontSize: 12, backgroundColor: Colors.blue[100]),
              ),
              maxRadius: 14,
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              'Melissa Flores',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
            itemCount: _messages.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, i) => _messages[i],
            reverse: true,
          )),
          const Divider(
            height: 1,
          ),
          _messageTextField()
        ],
      ),
    );
  }

  Container _messageTextField() {
    return Container(
      color: Colors.white,
      height: 50,
      child: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String text) {
                  setState(() {
                    _isWritting = text.trim().isEmpty ? false : true;
                  });
                },
                decoration:
                    const InputDecoration.collapsed(hintText: 'Send Message'),
                focusNode: _focusNode,
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Platform.isIOS
                    ? CupertinoButton(
                        child: const Text('Send'),
                        onPressed: _isWritting
                            ? () => _handleSubmit(_textController.text.trim())
                            : null,
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.blue[400]),
                          child: IconButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: _isWritting
                                  ? () =>
                                      _handleSubmit(_textController.text.trim())
                                  : null,
                              icon: const Icon(Icons.send)),
                        ),
                      ))
          ],
        ),
      )),
    );
  }

  void _handleSubmit(String text) {
    if (text.isEmpty) return;

    _textController.clear();
    _focusNode.requestFocus(); // To not to dispose the keyboard

    final newMessage = ChatMessage(
      animationController: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 400)),
      text: text,
      uuid: '123',
    );

    _messages.insert(0, newMessage);
    newMessage.animationController.forward(); // trigger the animation

    setState(() {
      _isWritting = false;
    });
  }

  @override
  void dispose() {
    // todo: turn off socket
    for (var message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
