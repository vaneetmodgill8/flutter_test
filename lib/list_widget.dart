import 'package:flutter/material.dart';

class BuildSliverListWidget extends StatelessWidget {
  const BuildSliverListWidget({
    Key key,
    @required this.dataArray,
  }) : super(key: key);

  final List<Color> dataArray;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        for (var data in dataArray) listCell(data),
      ]),
    );
  }

  Widget listCell(Color color) {
    return Card(
      margin: EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
      child: Container(
        color: color,
        height: 80,
      ),
    );
  }
}
