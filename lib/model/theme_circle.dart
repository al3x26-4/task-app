import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HalfLeftHalfRightCirclePainter extends CustomPainter {
  final Color leftColor;
  final Color rightColor;

  HalfLeftHalfRightCirclePainter({required this.leftColor, required this.rightColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint leftPaint = Paint()..color = leftColor;
    Paint rightPaint = Paint()..color = rightColor;

    canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), -pi / 2, pi, true, leftPaint);
    canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), pi / 2, pi, true, rightPaint);
  }

  @override
  bool shouldRepaint(HalfLeftHalfRightCirclePainter oldDelegate) {
    return leftColor != oldDelegate.leftColor || rightColor != oldDelegate.rightColor;
  }
}
