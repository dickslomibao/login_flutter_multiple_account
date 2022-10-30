import 'package:flutter/material.dart';

class AlertUser extends StatelessWidget {
  AlertUser({super.key, required this.title, required this.content});
  String title;
  String content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
      ),
      content: Text(
        content,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Ok"),
        ),
      ],
    );
  }
}
