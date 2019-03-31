import 'dart:ui';
import 'package:flutter/material.dart';

class DemoRect extends StatelessWidget {
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
      body: RectContent(),
    );
  }
}

class RectContent extends StatefulWidget {
  @override
  _RectContentState createState() => _RectContentState();
}

class _RectContentState extends State<RectContent>
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
    canvas.drawRect(
      Rect.fromPoints(Offset(30.0, 30.0), Offset(150.0, 100.0)),
      Paint()
        ..color = Colors.green
        ..strokeWidth = 4.0
        ..style = PaintingStyle.stroke,
    );
    canvas.drawPoints(
      PointMode.points,
      [
        Offset(30.0, 100.0),
      ],
      Paint()..strokeWidth = 4.0,
    );
    canvas.drawRect(
      Rect.fromPoints(Offset(210.0, 30.0), Offset(330.0, 100.0)),
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );
    canvas.drawRect(
      Rect.fromLTRB(30.0, 140.0, 150.0, 210.0),
      Paint()..color = Colors.white,
    );
    canvas.drawRect(
      Rect.fromLTWH(210.0, 140.0, 120.0, 70.0),
      Paint()..color = Colors.white,
    );
    canvas.drawRect(
      Rect.fromCircle(center: Offset(90.0, 300.0), radius: 60.0),
      Paint()
        ..color = Colors.white
        ..strokeWidth = 4.0
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
