import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0);

    /// [Top Left corner]
    var secondControlPoint = const Offset(0, 0);
    var secondEndPoint = Offset(width * .2, height * .3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    /// [Left Middle]
    var fifthControlPoint = Offset(width * .3, height * .5);
    var fiftEndPoint = Offset(width * .23, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fiftEndPoint.dx, fiftEndPoint.dy);

    /// [Bottom Left corner]
    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class LogoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(71.3 * _xScaling, 24.6 * _yScaling);
    path.cubicTo(
      77 * _xScaling,
      29.5 * _yScaling,
      80.8 * _xScaling,
      36.7 * _yScaling,
      82.4 * _xScaling,
      44.5 * _yScaling,
    );
    path.cubicTo(
      84 * _xScaling,
      52.2 * _yScaling,
      83.4 * _xScaling,
      60.6 * _yScaling,
      80.3 * _xScaling,
      68.9 * _yScaling,
    );
    path.cubicTo(
      77.1 * _xScaling,
      77.2 * _yScaling,
      71.6 * _xScaling,
      85.5 * _yScaling,
      64.1 * _xScaling,
      88 * _yScaling,
    );
    path.cubicTo(
      56.6 * _xScaling,
      90.4 * _yScaling,
      47.2 * _xScaling,
      87 * _yScaling,
      38 * _xScaling,
      83.5 * _yScaling,
    );
    path.cubicTo(
      28.8 * _xScaling,
      80 * _yScaling,
      19.8 * _xScaling,
      76.3 * _yScaling,
      14.299999999999997 * _xScaling,
      69.3 * _yScaling,
    );
    path.cubicTo(
      8.700000000000003 * _xScaling,
      62.4 * _yScaling,
      6.600000000000001 * _xScaling,
      52.2 * _yScaling,
      8.799999999999997 * _xScaling,
      43.3 * _yScaling,
    );
    path.cubicTo(
      11.100000000000001 * _xScaling,
      34.4 * _yScaling,
      17.700000000000003 * _xScaling,
      26.9 * _yScaling,
      25.3 * _xScaling,
      22.4 * _yScaling,
    );
    path.cubicTo(
      32.9 * _xScaling,
      17.799999999999997 * _yScaling,
      41.4 * _xScaling,
      16.200000000000003 * _yScaling,
      49.6 * _xScaling,
      16.700000000000003 * _yScaling,
    );
    path.cubicTo(
      57.7 * _xScaling,
      17.200000000000003 * _yScaling,
      65.5 * _xScaling,
      19.8 * _yScaling,
      71.3 * _xScaling,
      24.6 * _yScaling,
    );
    path.cubicTo(
      71.3 * _xScaling,
      24.6 * _yScaling,
      71.3 * _xScaling,
      24.6 * _yScaling,
      71.3 * _xScaling,
      24.6 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
