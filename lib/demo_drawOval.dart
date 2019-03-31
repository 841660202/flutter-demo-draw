import 'dart:ui';
import 'package:flutter/material.dart';

class DemoDrawOval extends StatelessWidget {
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
      body: OvalContent(),
    );
  }
}

class OvalContent extends StatefulWidget {
  @override
  _OvalContentState createState() => _OvalContentState();
}

class _OvalContentState extends State<OvalContent>
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
    canvas.drawOval(
      Rect.fromLTRB(30.0, 30.0, 150.0, 100.0),
      Paint()
        ..color = Colors.white
        ..strokeWidth = 3.0
        ..style = PaintingStyle.stroke,
    );
    canvas.drawOval(
      Rect.fromLTRB(210.0, 30.0, 330.0, 100.0),
      Paint()
        ..color = Colors.white
        ..strokeWidth = 3.0
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
