import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels(
      {Key? key,
      required this.route,
      required this.title,
      required this.subTitle})
      : super(key: key);

  final String title;
  final String subTitle;

  final String route;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(title,
          style: const TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w200)),
      const SizedBox(
        height: 10,
      ),
      GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, route),
        child: Text(
          subTitle,
          style: TextStyle(
              color: Colors.blue[600],
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
