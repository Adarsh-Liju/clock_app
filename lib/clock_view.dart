// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockView createState() => _ClockView();
}

class _ClockView extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xFF444974);

    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0XFF748EF6), Color(0XFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0XFFEA74AB), Color(0XFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);
    canvas.drawLine(center, Offset(100, 100), secHandBrush);
    canvas.drawLine(center, Offset(150, 100), minHandBrush);
    canvas.drawLine(center, Offset(200, 150), hourHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}