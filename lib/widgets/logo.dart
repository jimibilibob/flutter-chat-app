import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Center(
          child: SizedBox(
            width: 170,
            child: Column(
              children: const [
                Image(image: AssetImage('assets/tag-logo.png')),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Messenger',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
