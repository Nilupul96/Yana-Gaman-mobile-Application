import 'package:flutter/material.dart';

import '../../styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Function validator;
  final Function onChanged;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLength;
  final Widget prifixIcon;
  final int minLine;
  final int maxLine;
  final TextStyle hintStyle;
  final TextStyle labelStyle;
  final String labelText;
  final TextInputAction textInputAction;

  CustomTextField({
    this.controller,
    this.hint = "",
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.prifixIcon,
    this.maxLength,
    this.minLine,
    this.hintStyle,
    this.maxLine,
    this.labelText,
    this.textInputAction,
    this.onChanged,
    this.labelStyle,
  });

  static InputBorder enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(
    color: Color(0xffDFDFDF),
    //color: GrayColor
  ));

  static InputBorder errorBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.0,
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
      // decoration: cardDecoration,
      child: TextFormField(
        style: TextStyle(fontSize: 16.0),
        maxLines: maxLine,
        minLines: minLine,
        keyboardType: keyboardType,
        obscureText: obscureText,
        autofocus: false,
        textCapitalization: textCapitalization,
        controller: controller,
        validator: validator,
        readOnly: readOnly,
        maxLength: maxLength,
        onChanged: onChanged,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: labelText,
          prefixIcon: prifixIcon,
          hintText: hint,
          hintStyle: hintStyle,
          labelStyle: labelStyle,
          counterText: "",
          contentPadding: EdgeInsets.fromLTRB(25.0, 18.0, 20.0, 15.0),
          enabledBorder: enabledBorder,
          focusedBorder: enabledBorder,
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
          enabled: true,
        ),
      ),
    );
  }
}
