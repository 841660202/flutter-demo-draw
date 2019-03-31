import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class DemoPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          '点',
          style: TextStyle(color: Colors.white, letterSpacing: 1.0),
        ),
        backgroundColor: Color(0xff2979ff),
        centerTitle: true,
      ),
      body: PointContent(),
    );
  }
}

class PointContent extends StatefulWidget {
  @override
  _PointContentState createState() => _PointContentState();
}

class _PointContentState extends State<PointContent>
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
        height: 200.0,
        width: 200.0,
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
    canvas.drawPoints(
      PointMode.points,
      [
        Offset(30.0, 30.0),
        Offset(60.0, 30.0),
        Offset(90.0, 30.0),
        Offset(90.0, 60.0),
        Offset(60.0, 60.0),
        Offset(30.0, 60.0)
      ],
      Paint()..strokeWidth = 4.0,
    );
    canvas.drawPoints(
      PointMode.points,
      [
        Offset(160.0, 30.0),
        Offset(190.0, 30.0),
        Offset(220.0, 30.0),
        Offset(220.0, 60.0),
        Offset(190.0, 60.0),
        Offset(160.0, 60.0)
      ],
      Paint()
        ..strokeWidth = 4.0
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
