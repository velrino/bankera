import 'package:flutter/material.dart';
import 'dart:async';
import 'package:maestrya/maestrya.dart';
import 'package:bankera/shared/services/maestrya.dart';
import 'package:bankera/shared/components/loading/loading.dart';
import 'package:bankera/data/pages.dart';
import 'dart:convert';
import 'package:dynamic_widget/dynamic_widget.dart';

class DefaultClickListener implements ClickListener {
  var parameter;
  final BuildContext context;

  DefaultClickListener({Key key, @required this.context});

  @override
  void onClicked(String event) {
    parameter = event;
    this.build();
  }

  Widget build() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MaestryaPage(path: parameter)),
    );
  }
}

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
    return _isLoading ? LoadingComponent() : createListView(context);
  }

  Future<Null> _getData() async {
    setState(() {
      _isLoading = true;
    });
    //final items = await MaestryaService().getPage(this.path);
    final items = pages[this.path];
    setState(() {
      list = items;
      _isLoading = false;
    });

    return null;
  }

  handleJson() {}

  Widget createListView(BuildContext context) {
    String renderBody = '';
    dynamic renderHeader;
    dynamic test;
    bool listIsNotEmpty = (list != null);
    if (listIsNotEmpty) {
      renderHeader = Maestrya('').renderHeader(list['header']);
      renderBody = '''${json.encode(list['body'])}''';
    }

    return listIsNotEmpty
        ? Scaffold(
            appBar: renderHeader,
            body: new RefreshIndicator(
              key: refreshKey,
              onRefresh: _getData,
              child: FutureBuilder<dynamic>(
                future: Maestrya(renderBody).buildWidget(
                    context, new DefaultClickListener(context: context)),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  return snapshot.hasData
                      ? SizedBox.expand(
                          child: snapshot.data,
                        )
                      : Text("..Not Render..Loading...");
                },
              ),
            ))
        : Scaffold(
            body: Center(
            child: Text("Not Render"),
          ));
  }
}
