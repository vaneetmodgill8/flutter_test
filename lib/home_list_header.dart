import 'package:flutter/material.dart';
import 'dart:math' as math;

class BuildSliverListHeaderWidget extends StatelessWidget {
  const BuildSliverListHeaderWidget({
    Key key,
    @required this.headerText,
  }) : super(key: key);

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: false,
      delegate: _SliverAppBarDelegate(
        minHeight: 26,
        maxHeight: 50,
        child: Container(
          padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
          child: Text(
            headerText,
            style: TextStyle(fontSize: 22.0),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverAppBarDelegate({@required this.minHeight, @required this.maxHeight, @required this.child});

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
