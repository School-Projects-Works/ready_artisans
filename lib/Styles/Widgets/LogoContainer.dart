import 'package:flutter/material.dart';
import 'package:ready_artisans/Styles/Widgets/ClipPathShadow.dart';
import 'package:ready_artisans/Styles/Widgets/customClipper.dart';

import '../../generated/assets.dart';
import '../AppColors.dart';

class LogoFrame extends StatelessWidget {
  const LogoFrame({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipShadowPath(
      shadow: const BoxShadow(
        blurRadius: 5,
        spreadRadius: 8,
        offset: Offset(10, -10),
        color: secondaryColor,
      ),
      clipper: LogoClipper(),
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        height: size.height,
        width: size.width,
        child: Image.asset(
          Assets.imagesLogoSmallT,
          height: 100,
          width: 100,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
