import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class DemoPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          '多边形',
          style: TextStyle(color: Colors.white, letterSpacing: 1.0),
        ),
        backgroundColor: Color(0xff2979ff),
        centerTitle: true,
      ),
      body: PointsContent(),
    );
  }
}

class PointsContent extends StatefulWidget {
  @override
  _PointsContentState createState() => _PointsContentState();
}

class _PointsContentState extends State<PointsContent>
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
      PointMode.polygon,
      [
        Offset(160.0, 100.0),
        Offset(190.0, 100.0),
        Offset(220.0, 100.0),
        Offset(220.0, 130.0),
        Offset(190.0, 130.0),
        Offset(160.0, 130.0)
      ],
      Paint()
        ..strokeWidth = 4.0
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
