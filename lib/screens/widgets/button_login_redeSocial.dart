import 'package:flutter/material.dart';

class ButtonLoginRedeSocial extends StatelessWidget {
  final String imageLogo;
  final Color color;

  const ButtonLoginRedeSocial(
      {Key? key, required this.imageLogo, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child:
              SizedBox(width: 35, height: 35, child: Image.asset(imageLogo))),
    );
  }
}
