import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  GradientCircularProgressIndicator(
      {this.stokeWidth = 2.0,
      @required this.radius,
      @required this.colors,
      this.stops,
      this.strokeCapRound = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.totalAngle = 2 * pi,
      this.value});

  ///粗细
  final double stokeWidth;

  /// 圆的半径
  final double radius;

  ///两端是否为圆角
  final bool strokeCapRound;

  /// 当前进度，取值范围 [0.0-1.0]
  final double value;

  /// 进度条背景色
  final Color backgroundColor;

  /// 进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final double totalAngle;

  /// 渐变色数组
  final List<Color> colors;

  /// 渐变色的终止点，对应colors属性
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    // 下面调整的角度的计算公式是通过数学几何知识得出，读者有兴趣可以研究一下为什么是这样
    if (strokeCapRound) {
      _offset = asin(stokeWidth / (radius * 2 - stokeWidth)); // 两头半圆一个整圆
      print(sin(_offset));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }
    return Column(children: [
      CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
          stokeWidth: stokeWidth,
          strokeCapRound: strokeCapRound,
          backgroundColor: backgroundColor,
          value: value,
          total: totalAngle,
          radius: radius,
          colors: _colors,
        ),
      )
    ]);
  }
}

//实现画笔
class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter(
      {this.stokeWidth: 10.0,
      this.strokeCapRound: false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.radius,
      this.total = 2 * pi,
      @required this.colors,
      this.stops,
      this.value});

  final double stokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = stokeWidth / 2.0;
    double _value = (value ?? .0);
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;

    if (strokeCapRound) {
      _start = asin(stokeWidth / (size.width - stokeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - stokeWidth, size.height - stokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = stokeWidth;

    // 先画背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }

    // 再画前景，应用渐变
    if (_value > 0) {
      paint.shader = SweepGradient(
        startAngle: 0.0,
        endAngle: _value,
        colors: colors,
        stops: stops,
      ).createShader(rect);

      canvas.drawArc(
        rect,
        _start,
        _value,
        false,
        paint,
      );
    }
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
        Paint()..strokeWidth = 4.0);
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
          ..strokeCap = StrokeCap.round);
    // 绘制线
    canvas.drawPoints(
        PointMode.lines,
        [
          Offset(30.0, 100.0),
          Offset(60.0, 100.0),
          Offset(90.0, 100.0),
          Offset(90.0, 130.0),
          Offset(60.0, 130.0),
          Offset(30.0, 130.0)
        ],
        Paint()
          ..strokeWidth = 4.0
          ..strokeCap = StrokeCap.round);
// 绘制多边形
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
          ..strokeCap = StrokeCap.round);
    const PI = 3.1415926;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(60.0, 60.0), radius: 80.0),
        0.0,
        PI / 2,
        false,
        Paint()
          ..color = Colors.red
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(200.0, 60.0), radius: 80.0),
        0.0,
        PI / 2,
        false,
        Paint()
          ..color = Colors.red
          ..strokeWidth = 4.0
          ..style = PaintingStyle.fill);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(90.0, 160.0), radius: 80.0),
        0.0,
        PI * 2 / 3,
        true,
        Paint()
          ..color = Colors.red
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(250.0, 160.0), radius: 80.0),
        0.0,
        PI * 2 / 3,
        true,
        Paint()
          ..color = Colors.red
          ..strokeWidth = 4.0
          ..style = PaintingStyle.fill);
    canvas.drawArc(
        Rect.fromLTWH(30.0, 30.0, 200.0, 100.0),
        0.0,
        5.0,
        true,
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill);
    canvas.drawArc(
        Rect.fromPoints(Offset(260.0, 260.0), Offset(20.0, 20.0)),
        0.0,
        5.0,
        true,
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill);
    canvas.drawRect(
        Rect.fromPoints(Offset(30.0, 30.0), Offset(150.0, 100.0)),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);
    canvas.drawRect(
        Rect.fromPoints(Offset(210.0, 30.0), Offset(330.0, 100.0)),
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill);
    canvas.drawRect(Rect.fromLTRB(30.0, 140.0, 150.0, 210.0),
        Paint()..color = Colors.white);
    canvas.drawRect(Rect.fromLTWH(210.0, 140.0, 120.0, 70.0),
        Paint()..color = Colors.white);
    canvas.drawRect(
        Rect.fromCircle(center: Offset(90.0, 300.0), radius: 60.0),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4.0
          ..style = PaintingStyle.stroke);


          canvas.drawRRect(
    RRect.fromLTRBXY(30.0, 30.0, 150.0, 100.0, 8.0, 8.0),
    Paint()..color = Colors.white..strokeWidth = 4.0..style = PaintingStyle.stroke);
canvas.drawRRect(
    RRect.fromLTRBXY(210.0, 30.0, 330.0, 100.0, 8.0, 18.0),
    Paint()..color = Colors.white..style = PaintingStyle.fill);
// RRect.fromLTRBR 方式
canvas.drawRRect(
    RRect.fromLTRBR(30.0, 140.0, 150.0, 210.0, Radius.circular(8.0)),
    Paint()..color = Colors.white..strokeWidth = 4.0..style = PaintingStyle.stroke);
// RRect.fromLTRBAndCorners 方式
canvas.drawRRect(
    RRect.fromLTRBAndCorners(210.0, 140.0, 330.0, 210.0,
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(20.0),
        bottomRight: Radius.circular(5.0),
        bottomLeft: Radius.circular(20.0)),
    Paint()..color = Colors.white..strokeWidth = 4.0..style = PaintingStyle.stroke);
// RRect.fromRectAndCorners 方式
canvas.drawRRect(
    RRect.fromRectAndCorners(Rect.fromLTWH(30.0, 260.0, 120.0, 70.0),
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(20.0),
        bottomRight: Radius.circular(5.0),
        bottomLeft: Radius.circular(20.0)),
    Paint()..color = Colors.white..strokeWidth = 4.0..style = PaintingStyle.stroke);
// RRect.fromRectAndRadius 方式
canvas.drawRRect(
    RRect.fromRectAndRadius(Rect.fromLTWH(210.0, 260.0, 120.0, 70.0),
        Radius.elliptical(8.0, 18.0)),
    Paint()..color = Colors.white..strokeWidth = 4.0..style = PaintingStyle.stroke);
// RRect.fromRectXY 方式
canvas.drawRRect(
    RRect.fromRectXY(
        Rect.fromCircle(center: Offset(90.0, 420.0), radius: 60.0),
        8.0, 8.0),
    Paint()..color = Colors.white..strokeWidth = 4.0..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
