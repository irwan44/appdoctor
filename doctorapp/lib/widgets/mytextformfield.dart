import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  dynamic mHint,
      mObscureText,
      mController,
      mkeyboardType,
      mTextInputAction,
      mInputBorder,
      mTextColor,
      mHintTextColor,
      mTextAlign,
      mMaxLine,
      mMaxLength,
      mReadOnly;

  MyTextFormField({
    Key? key,
    required this.mHint,
    this.mObscureText,
    this.mController,
    this.mkeyboardType,
    this.mTextInputAction,
    this.mInputBorder,
    this.mHintTextColor,
    this.mTextColor,
    this.mTextAlign,
    this.mMaxLine,
    this.mReadOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mController,
      keyboardType: mkeyboardType,
      textInputAction: mTextInputAction,
      obscureText: mObscureText,
      maxLength: mMaxLength,
      maxLines: mMaxLine,
      readOnly: mReadOnly ?? false,
      decoration: InputDecoration(
        hintText: mHint,
        hintStyle: GoogleFonts.roboto(
          fontSize: 16,
          color: mHintTextColor,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        border: mInputBorder,
      ),
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: 16,
          color: mTextColor,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
