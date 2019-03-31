import 'package:demo1/demo_clipPath.dart';
import 'package:demo1/demo_drawArc.dart';
import 'package:demo1/demo_drawCircle.dart';
import 'package:demo1/demo_drawLine.dart';
import 'package:demo1/demo_drawOval.dart';
import 'package:demo1/demo_drawPath.dart';
import 'package:demo1/demo_drawPoint.dart';
import 'package:demo1/demo_drawPoints.dart';
import 'package:demo1/demo_drawRRect.dart';
import 'package:demo1/demo_form.dart';
import 'package:demo1/demo_rect.dart';
import 'package:demo1/widgets/circle.dart';
import 'package:flutter/material.dart';

class RoutePro {
  final String url;
  final Widget wgt;
  RoutePro({
    @required this.url,
    @required this.wgt,
  });
}
// routes
// add a route need flutter run again
Map<String, Widget> _map = {
  "/navList": Circle(),
  "/home": Circle(),
  "/form": DemoForm(),
  "/demoPoint": DemoPoint(),
  "/demoLine": DemoLine(),
  "/drawPoints": DemoPoints(),
  "/demoDrawArc": DemoDrawArc(),
  "/demoRect": DemoRect(),
  "/demoRRect": DemoRRect(),
  "/demoCircle": DemoCircle(),
  "/demoDrawOval": DemoDrawOval(),
  "/demoPath": DemoPath(),
  "/demoClipPath": DemoClipPath(),
};

// map->list
List<RoutePro> getRouteList() {
  List<RoutePro> list = [];
  _map.forEach((url, value) {
    list.add(RoutePro(url: url, wgt: value));
  });
  return list;
}

Map<String, WidgetBuilder> getRoutes(BuildContext context) {
  Map<String, WidgetBuilder> __map = new Map();
  _map.forEach((url, value) {
    __map[url] = (context) => value;
    print(url);
    // 带参数的情况在这里处理
  });
  return __map;
}

// TODO 数组转化成数组，数组转化成对象 对象转化成数组， 对象转化成对象
