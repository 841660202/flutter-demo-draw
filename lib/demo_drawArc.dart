import 'dart:ui';
import 'package:flutter/material.dart';

class DemoDrawArc extends StatelessWidget {
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
      body: DrawArcContent(),
    );
  }
}

class DrawArcContent extends StatefulWidget {
  @override
  _DrawArcContentState createState() => _DrawArcContentState();
}

class _DrawArcContentState extends State<DrawArcContent>
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
        color: Colors.redAccent,
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
    canvas.drawArc(
      Rect.fromCircle(center: Offset(60.0, 60.0), radius: 80.0),
      0.0,
      PI / 2,
      false,
      Paint()
        ..color = lineColor
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 4.0
        ..style = PaintingStyle.stroke,
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(200.0, 60.0), radius: 80.0),
      0.0,
      PI / 2,
      false,
      Paint()
        ..color = lineColor
        ..strokeWidth = 4.0
        ..style = PaintingStyle.fill,
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(90.0, 160.0), radius: 80.0),
      0.0,
      PI * 2 / 3,
      true,
      Paint()
        ..color = lineColor
        ..strokeWidth = 4.0
        ..style = PaintingStyle.stroke,
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(250.0, 160.0), radius: 80.0),
      0.0,
      PI * 2 / 3,
      true,
      Paint()
        ..color = lineColor
        ..strokeWidth = 4.0
        ..style = PaintingStyle.fill,
    );
    canvas.drawArc(
      Rect.fromLTWH(30.0, 300.0, 200.0, 100.0),
      0.0,
      5.0,
      true,
      Paint()
        ..color = lineColor
        ..style = PaintingStyle.fill,
    );
    canvas.drawArc(
      Rect.fromPoints(Offset(260.0, 260.0), Offset(320.0, 420.0)),
      0.0,
      5.0,
      true,
      Paint()
        ..color = lineColor
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
