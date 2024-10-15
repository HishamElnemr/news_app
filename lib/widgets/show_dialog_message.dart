import 'package:flutter/material.dart';

class AlertDialogMessage extends StatelessWidget {
  const AlertDialogMessage(
      {super.key, required this.message, required this.tittle, this.color});
  final String message;
  final String tittle;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        tittle,
        softWrap: true,
        style: TextStyle(
          color: color ?? Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      content: Text(
        message,
        softWrap: true,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
