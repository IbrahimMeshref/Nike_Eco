import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final double height;
  final String text;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool? isPassword;

  const CustomTextField({
    required this.height,
    required this.text,
    this.validator,
    required this.controller,
    this.isPassword,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          height: widget.height * .01,
        ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.isPassword != null ? _obscureText : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            contentPadding: EdgeInsets.all(12),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: widget.isPassword != null
                ? InkWell(
              onTap: () {
                _obscureText = !_obscureText;
                setState(() {});
              },
              child: Icon(_obscureText
                  ? CupertinoIcons.eye_fill
                  : CupertinoIcons.eye_slash_fill),
            )
                : null,
          ),
        ),
      ],
    );
  }
}