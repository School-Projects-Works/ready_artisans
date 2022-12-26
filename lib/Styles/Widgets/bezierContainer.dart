// ignore: file_names
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ready_artisans/Styles/AppColors.dart';
import 'package:ready_artisans/Styles/Widgets/ClipPathShadow.dart';
import 'customClipper.dart';

class StyleShape extends StatelessWidget {
  const StyleShape(
      {Key? key, this.color = const [Color(0xfffbb448), Color(0xffe46b10)]})
      : super(key: key);
  final List<Color> color;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 3.5,
      child: ClipShadowPath(
        shadow: const BoxShadow(
          blurRadius: 5,
          spreadRadius: 8,
          offset: Offset(10, -10),
          color: secondaryColor,
        ),
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: color)),
        ),
      ),
    );
  }
}
