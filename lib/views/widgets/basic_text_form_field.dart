import 'package:dsw_51744/utils/my_colours.dart';
import 'package:flutter/material.dart';

class BasicTextFormField extends StatefulWidget {
  final IconData? icon;
  final IconData? iconButton;
  final String? marker;
  final bool Password;
  final TextEditingController? controller;

  const BasicTextFormField({
    super.key,
    this.icon,
    this.marker,
    this.iconButton,
    this.Password = false,
    this.controller,
  });

  @override
  State<BasicTextFormField> createState() => _BasicTextFormFieldState();

}

class _BasicTextFormFieldState extends State<BasicTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.Password ? _obscureText:false,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.Password ?
            IconButton(
              icon: Icon(_obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),
              onPressed: (){
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
            :
            (widget.iconButton !=null ? Icon(widget.iconButton) : null),
        prefixIconColor: MyColors.purpleColor,
        hintText: widget.marker,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: MyColors.borderColor,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: MyColors.borderColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: MyColors.borderColor,
            width: 2.0
          ),
        ),
      ),
    );
  }
}
