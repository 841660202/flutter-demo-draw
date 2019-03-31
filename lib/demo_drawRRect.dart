import 'dart:ui';
import 'package:flutter/material.dart';

class DemoRRect extends StatelessWidget {
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
      body: RRectContent(),
    );
  }
}

class RRectContent extends StatefulWidget {
  @override
  _RRectContentState createState() => _RRectContentState();
}

class _RRectContentState extends State<RRectContent>
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
    // RRect.fromLTRBXY 方式
    canvas.drawRRect(
      RRect.fromLTRBXY(30.0, 30.0, 150.0, 100.0, 8.0, 8.0),
      Paint()
        ..color = Colors.white
        ..strokeWidth = 4.0
        ..style = PaintingStyle.stroke,
    );
    canvas.drawRRect(
        RRect.fromLTRBXY(210.0, 30.0, 330.0, 100.0, 8.0, 18.0),
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill);
// RRect.fromLTRBR 方式
    canvas.drawRRect(
        RRect.fromLTRBR(30.0, 140.0, 150.0, 210.0, Radius.circular(8.0)),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);
// RRect.fromLTRBAndCorners 方式
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(210.0, 140.0, 330.0, 210.0,
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(20.0)),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4.0
          ..style = PaintingStyle.fill);
// RRect.fromRectAndCorners 方式
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(30.0, 260.0, 120.0, 70.0),
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(20.0)),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);
// RRect.fromRectAndRadius 方式
    canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(210.0, 260.0, 120.0, 70.0),
            Radius.elliptical(8.0, 18.0)),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);
// RRect.fromRectXY 方式
    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCircle(center: Offset(90.0, 420.0), radius: 60.0),
            8.0,
            8.0),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);
    canvas.drawDRRect(
        RRect.fromRectXY(
            Rect.fromCircle(center: Offset(90.0, 420.0), radius: 60.0),
            8.0,
            8.0),
        RRect.fromRectXY(
            Rect.fromCircle(center: Offset(90.0, 420.0), radius: 54.0),
            8.0,
            8.0),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
