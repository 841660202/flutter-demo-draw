import 'dart:ui';
import 'package:flutter/material.dart';

class DemoPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          '线',
          style: TextStyle(color: Colors.white, letterSpacing: 1.0),
        ),
        backgroundColor: Color(0xff2979ff),
        centerTitle: true,
      ),
      body: PathContent(),
    );
  }
}

class PathContent extends StatefulWidget {
  @override
  _PathContentState createState() => _PathContentState();
}

class _PathContentState extends State<PathContent>
    with TickerProviderStateMixin {
  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.pinkAccent,
        child: new CustomPaint(
          foregroundPainter: new MyPainter(
            lineColor: Colors.lightBlueAccent,
            completeColor: Colors.blueAccent,
            completePercent: percentage,
            width: 8.0,
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;

  MyPainter({
    this.lineColor,
    this.completeColor,
    this.completePercent,
    this.width,
  });
  @override
  void paint(Canvas canvas, Size size) {
    const PI = 3.1415926;
    canvas.drawPath(
        Path()
          ..moveTo(30.0, 100.0)
          ..lineTo(120.0, 100.0)
          ..lineTo(90.0, 130.0)
          ..lineTo(180.0, 130.0)
          ..close(),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);
    canvas.drawPath(
        Path()
          ..moveTo(200.0, 100.0)
          ..lineTo(290.0, 100.0)
          ..lineTo(260.0, 130.0)
          ..lineTo(350.0, 130.0)
          ..close(),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 3.0
          ..style = PaintingStyle.fill);
    canvas.drawPath(
        Path()
          ..moveTo(30.0, 170.0)
          ..lineTo(120.0, 170.0)
          ..lineTo(90.0, 210.0)
          ..lineTo(180.0, 210.0)
          ..addRect(Rect.fromLTWH(180.0, 210.0, 120.0, 70.0))
          ..addOval(Rect.fromLTWH(180.0, 210.0, 120.0, 70.0))
          ..moveTo(230.0, 170.0)
          ..lineTo(320.0, 170.0)
          ..close(),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);
    canvas.drawPath(
        Path()
          ..arcTo(Rect.fromCircle(center: Offset(60, 300), radius: 80), -PI / 6,
              PI * 2 / 3, false),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);
    canvas.drawPath(
        Path()
          ..moveTo(210.0, 300.0)
          ..cubicTo(210.0, 390.0, 270.0, 330.0, 330.0, 300.0),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
