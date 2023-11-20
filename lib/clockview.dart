import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class ClockView extends StatefulWidget {
  final double size;
  const ClockView({super.key, this.size = 300});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2; // 150
    var centerY = size.height / 2; // 150
    var center = Offset(centerX, centerY); // 150, 150

    var radius = min(centerX, centerY); // 150

    var fillBrush = Paint()..color = const Color(0xFF444974);
    var outlineBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..strokeWidth = size.width / 20
      ..style = PaintingStyle.stroke;
    var centerFillBrush = Paint()..color = const Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..color = Colors.orange[300] as Color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 60;

    var minHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 30;

    var hourHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 24 ;

    canvas.drawCircle(
      center,
      radius * 0.75,
      fillBrush,
    );
    canvas.drawCircle(
      center,
      radius * 0.75,
      outlineBrush,
    );

    // 60 sec - 360 degree = 6 degree for every second
    // 1 sec - 6 degree = x degree for every second
    // x = 1 sec * 6 degree
    // x = 6 degree
    // 1 min - 360 degree = 6 degree for every minute
    // 1 min - 6 degree = x degree for every minute
    // x = 1 min * 6 degree
    // x = 6 degree
    // 1 hour - 360 degree = 30 degree for every hour
    // 1 hour - 30 degree = x degree for every hour
    // x = 1 hour * 30 degree
    // x = 30 degree

    // 150 + 80 * cos(0 * 6 * 3,14 /180);

    var secHandX = centerX + radius * 0.6 * cos(DateTime.now().second * 6 * pi / 180);
    var secHandY = centerY + radius * 0.6 * sin(DateTime.now().second * 6 * pi / 180);
    var minHandX = centerX + radius * 0.6 * cos(DateTime.now().minute * 6 * pi / 180);
    var minHandY = centerY + radius * 0.6 * sin(DateTime.now().minute * 6 * pi / 180);
    var hourHandX = centerX + radius * 0.4 * cos((DateTime.now().hour * 30 + DateTime.now().minute * 0.5) * pi / 180);
    var hourHandY = centerY + radius * 0.4 * sin((DateTime.now().hour * 30 + DateTime.now().minute * 0.5) * pi / 180);

    canvas.drawLine(
      center,
      Offset(secHandX, secHandY),
      secHandBrush,
    );
    canvas.drawLine(
      center,
      Offset(minHandX, minHandY),
      minHandBrush,
    );
    canvas.drawLine(
      center,
      Offset(hourHandX, hourHandY),
      hourHandBrush,
    );
    canvas.drawCircle(
      center,
      radius * 0.12,
      centerFillBrush,
    );

    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var outerCircleRadius = radius;
    var innerCircleRadius = radius * 0.9;

    for (var i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(
        Offset(x1, y1),
        Offset(x2, y2),
        dashBrush,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
