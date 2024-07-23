import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DropDownButtonList extends StatefulWidget {
  String listValue;
  final List<String> list;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? lableStyle;
  final String lableText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController controller;
  //final Function(String?) validator;
  DropDownButtonList({
    super.key,
    required this.list,
    required this.listValue,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.lableStyle,
    required this.lableText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    required this.controller,
    //required this.validator,
  });

  @override
  State<DropDownButtonList> createState() => _DropDownButtonListState();
}

class _DropDownButtonListState extends State<DropDownButtonList> {
  @override
  Widget build(BuildContext context) {
    widget.controller.text = widget.listValue;
    return DropdownButtonFormField(
      style: TextStyles.font14DarkBlueMedium,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.mainRed,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.lighterGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        labelStyle: widget.lableStyle ?? TextStyles.font14LightGrayRegular,
        labelText: widget.lableText,
        suffixIcon: widget.suffixIcon,
        fillColor: widget.backgroundColor ?? ColorsManager.moreLightGray,
        filled: true,
      ),

      // Initial Value
      value: widget.listValue,

      // Array list of items
      items: widget.list.map((String items) {
        return  DropdownMenuItem(
          value: items,
          child: Text(items),
        );

      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          widget.listValue = newValue!;
          widget.controller.text = newValue;
          print("xxxxxxxxxxx");
          print(widget.listValue);
          print(widget.controller.text);
        });
      },
    );
  }
}
