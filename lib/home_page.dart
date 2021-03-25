import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sample_test/list_widget.dart';
import 'package:flutter_sample_test/home_list_header.dart';
import 'package:flutter_sample_test/grid_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController = new ScrollController();
  bool showBottomButton = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        showBottomButton = (_scrollController.position.pixels > 8) ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  BuildSliverListHeaderWidget(headerText: "Vertical List Header"),
                  BuildSliverListWidget(dataArray: [Colors.green, Colors.blue, Colors.redAccent]),
                  BuildSliverListHeaderWidget(headerText: "Horizontal List Header"),
                  BuildSliverGridWidget(),
                  BuildSliverListHeaderWidget(headerText: "Vertical List Header"),
                  BuildSliverListWidget(
                      dataArray: [Colors.blue, Colors.brown, Colors.green, Colors.blue, Colors.brown, Colors.green]),
                ],
              ),
            ),
            scrollToTopButton(),
          ],
        ),
      ),
    );
  }

  Widget scrollToTopButton() {
    return Visibility(
      visible: showBottomButton,
      child: GestureDetector(
        onTap: () {
          _scrollController.animateTo(
            0.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
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
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              'Scroll To Top',
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        ),
      ),
    );
  }
}
