import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText, hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final EdgeInsetsGeometry? padding;
  const CustomTextField(
      {required this.controller,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      this.obscureText = false,
      this.padding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: Theme.of(context).textTheme.bodyText2,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyText2,
            enabledBorder:
                border(context, color: Theme.of(context).primaryColor),
            focusedBorder:
                border(context, color: Theme.of(context).primaryColor),
            errorBorder: border(context),
            focusedErrorBorder: border(context),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            contentPadding: const EdgeInsets.all(20),
            suffixIcon: suffixIcon),
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  InputBorder border(BuildContext context, {Color? color}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).cardColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      );
}

class CustomDropDown extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final Function(dynamic) onChanged;
  final String? labelText, hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? padding;
  const CustomDropDown(
      {required this.items,
      required this.onChanged,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      this.padding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: Theme.of(context).textTheme.bodyText2,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyText2,
            enabledBorder:
                border(context, color: Theme.of(context).primaryColor),
            focusedBorder:
                border(context, color: Theme.of(context).primaryColor),
            errorBorder: border(context),
            focusedErrorBorder: border(context),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            contentPadding: const EdgeInsets.all(17),
            suffixIcon: suffixIcon),
        style: Theme.of(context).textTheme.bodyText1,
        items: items,
        onChanged: onChanged,
      ),
    );
  }

  InputBorder border(BuildContext context, {Color? color}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).cardColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      );
}
