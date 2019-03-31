import 'package:flutter/material.dart';

class DemoClipPath extends StatelessWidget {
  final Widget child;

  DemoClipPath({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('裁切'),
        ),
        body: Column(
          children: <Widget>[
            ClipPath(
              clipper: BottomClip(),
              child: Container(
                color: Colors.deepOrangeAccent,
                height: 300.0,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ));
  }
}

class BottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 60);

    var firstConstrolPoint = Offset(size.width / 2, size.height);
    var firstEdnConstrolPoint = Offset(size.width, size.height - 60);
    path.quadraticBezierTo(
      firstConstrolPoint.dx,
      firstConstrolPoint.dy,
      firstEdnConstrolPoint.dx,
      firstEdnConstrolPoint.dy,
    );
    path.lineTo(size.width, size.height - 60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
