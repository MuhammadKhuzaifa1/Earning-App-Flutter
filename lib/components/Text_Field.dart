import 'package:flutter/material.dart';

class Text_Field extends StatefulWidget {
  bool? obscureTexts ;
  String? lable;
  TextEditingController? controller;
  final FormFieldValidator onValidator;

   Text_Field({this.lable,this.controller,required this.onValidator,this.obscureTexts});

  @override
  State<Text_Field> createState() => _Text_FieldState();
}

class _Text_FieldState extends State<Text_Field> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      child: TextFormField(obscureText: widget.obscureTexts!,
        validator: widget.onValidator,
        controller: widget.controller ,
        decoration: InputDecoration(labelText: widget.lable ),
      ),
    );
  }
}
