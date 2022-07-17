import 'package:flutter/material.dart';
class ReusableTextFiled extends StatelessWidget {
  ReusableTextFiled({this.onChange,this.suffixIcon,this.prefixIcon,this.hintText,this.labelText,this.textInputType,this.textController,this.validator});
  String labelText,hintText;
  Icon prefixIcon,suffixIcon;
  Function onChange,validator;
  TextInputType textInputType;
  TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      onChanged: onChange
      ,keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide:
          const BorderSide(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: prefixIcon,




      ),
   validator:validator ,
    );
  }
}
