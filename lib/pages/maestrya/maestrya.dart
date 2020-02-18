import 'package:flutter/material.dart';
import 'dart:async';
import 'package:maestrya/maestrya.dart';
import 'package:bankera/shared/services/maestrya.dart';
import 'package:bankera/shared/components/loading/loading.dart';

class MaestryaPage extends StatefulWidget {
  final String path;

  MaestryaPage({Key key, @required this.path});

  @override
  _MaestryaPageState createState() => new _MaestryaPageState(path: this.path);
}

class _MaestryaPageState extends State<MaestryaPage> {
  final String path;
  _MaestryaPageState({Key key, @required this.path});

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var list;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? LoadingComponent() : createListView();
  }

  Future<Null> _getData() async {
    setState(() {
      _isLoading = true;
    });
    final items = await MaestryaService().getPage(this.path);

    setState(() {
      list = items;
      _isLoading = false;
    });

    return null;
  }

  Widget createListView() {
    List<Widget> childrenWidgets = [];

    if (list != null) {
      childrenWidgets = Maestrya().render(list['data']['body']['render']);
    }

    return Scaffold(
        body: new RefreshIndicator(
            key: refreshKey,
            onRefresh: _getData,
            child: new ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return new Column(
                  children: childrenWidgets,
                );
              },
            )));
  }
}
