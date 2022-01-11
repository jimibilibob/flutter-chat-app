import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final Function onPress;
  final String string;

  const BlueButton({Key? key, required this.onPress, required this.string})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // todo: create button
        TextButton(
      onPressed: () => onPress(),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Center(
          child: Text(
            string,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        primary: Colors.blue[50],
        shape: const StadiumBorder(),
      ),
      // style: ButtonStyle(
      // backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      //     ),
    );
  }
}
