import 'package:flutter/material.dart';

class BuildSliverGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        height: 60.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                height: 60,
              ),
            );
          },
        ),
      ),
    );
  }
}
