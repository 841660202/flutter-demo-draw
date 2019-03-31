import 'package:demo1/route.dart';
import 'package:flutter/material.dart';

// TODO 分割线
class NavList extends StatefulWidget {
  final Widget child;

  NavList({Key key, this.child}) : super(key: key);

  _NavListState createState() => _NavListState();
}

class _NavListState extends State<NavList> {
  List list = getRouteList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航列表'),
      ),
      body: ListView.builder(
        itemCount: list?.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index].url),
            onTap: (){
              Navigator.of(context).pushNamed(list[index].url);
            },
          );
        },
      ),
    );
  }
}
