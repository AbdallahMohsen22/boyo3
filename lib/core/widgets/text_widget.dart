import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:flutter/material.dart';


class HeaderText extends StatelessWidget {
  final String text;
  HeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.font20MainRed
    );
  }
}



class BigContentText extends StatelessWidget {
  final String text;
  BigContentText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:TextStyles.font18BlackBold,
    );
  }
}


class ContentText extends StatelessWidget {
  final String text;
  ContentText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      style: TextStyles.font15BlackBold,
    );
  }
}

