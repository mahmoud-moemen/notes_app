import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,required this.hintText, this.maxLines = 1, this.onSaved, this.onChanged}) : super(key: key);

  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      onSaved: onSaved,
      validator: (value)
      {
        if(value?.isEmpty ?? true)
        {
          return 'Field is required';
        }
        else
        {
          return null;
        }
      },
      cursorColor:kPrimaryColor ,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder( kPrimaryColor),
      ),
    );
  }


  OutlineInputBorder buildOutlineInputBorder([color]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color:color?? Colors.white)
  );
}
