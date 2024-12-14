import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.labelText,
    this.labelColor,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? labelColor;
  final bool obscureText;
  final IconData? prefixIcon;
  final Icon? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _focusNode,
      builder: (context, child) {
        final isFocused = _focusNode.hasFocus;
        return TextFormField(
          style: const TextStyle(color: Colors.white,fontSize: 14),
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.obscureText,
          focusNode: _focusNode,
          cursorColor: Colors.blueAccent,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: isFocused ? Colors.blueAccent : Colors.grey,
              fontSize: 16,
            ),
            prefixIcon: Icon(
              widget.prefixIcon,
              color: isFocused ? Colors.blueAccent : Colors.grey,
            ),
            suffixIcon: widget.suffixIcon,
            hintStyle: const TextStyle(color: Colors.grey),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}
