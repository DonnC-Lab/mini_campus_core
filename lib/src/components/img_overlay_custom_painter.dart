// CustomPainter class to for the header curved-container

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderCurvedContainer extends CustomPainter {
  final ui.Image bgImage;

  const HeaderCurvedContainer(this.bgImage);

  @override
  void paint(Canvas canvas, Size size) {
    double screenH = 0.45.sh;

    double curveRatio = 600.0;

    Path path = Path()
      ..relativeLineTo(0, screenH)
      ..quadraticBezierTo(size.width / 2, curveRatio, size.width, screenH)
      ..relativeLineTo(0, -screenH)
      ..close();

    canvas.drawPath(
      path,
      Paint()
        ..shader = ImageShader(
          bgImage,
          TileMode.clamp,
          TileMode.clamp,
          Matrix4.identity().scaled(0.1, 0.2).storage,
        ),
    );

    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

Future<ui.Image> loadCurveImageBg() async {
  ByteData bd = await rootBundle.load('<asset-file-path>');
  
  final Uint8List bytes = Uint8List.view(bd.buffer);
  final codec = await ui.instantiateImageCodec(bytes);
  final ui.Image image = (await codec.getNextFrame()).image;

  return image;
}
