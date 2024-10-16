import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.text,
    required this.onChanged,
    this.validator,
  });
  final String labelText;
  final String hintText;
  final String text;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          onChanged: onChanged,
          obscureText: text == 'Password' ? true : false,
          validator: validator ?? (data) {
            if (data!.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w200),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 197, 197, 197),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 197, 197, 197),
              fontSize: 15,
              fontWeight: FontWeight.w200,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
