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
    return _isLoading ? LoadingComponent() : createListView(context);
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

  Widget createListView(BuildContext context) {
    List<Widget> childrenWidgets = [];
    dynamic render;
    bool listIsNotEmpty = (list != null);
    if (listIsNotEmpty) {
      render = Maestrya('').render(list);
      //   childrenWidgets = render['body'];
    }
    var raisedButton_json = '''
{
    "type": "ListView",
    "padding": "10, 10, 10, 10",
    "pageSize": 10,
    "children": [
        {
            "type": "Padding",
            "padding": "0,10,0,10",
            "child": {
                "type": "ListTile",
                "title": {
                    "type": "Padding",
                    "padding": "0,10,0,10",
                    "child": {
                        "type": "Text",
                        "data": "Upgrade Conta",
                        "style": {
                            "color": "#000000",
                            "fontSize": 20.0
                        }
                    }
                },
                "subtitle": {
                    "type": "Text",
                    "data": "Faça o upgrade da sua conta 1.0 para uma 2.0 na palma da sua mão",
                    "maxLines": 5
                }
            }
        },
        {
            "type": "ListTile",
            "title": {
                "type": "Text",
                "data": "Seu atual limite"
            },
            "subtitle": {
                "type": "Text",
                "data": "R\$ 2.000,00"
            }
        },
        {
            "type": "ListTile",
            "title": {
                "type": "Text",
                "data": "Sua atual modalidade"
            },
            "subtitle": {
                "type": "Text",
                "data": "1.0"
            }
        },
        {
            "type": "ListTile",
            "title": {
                "type": "Text",
                "data": "Sua atual bandeira"
            },
            "subtitle": {
                "type": "AssetImage",
                "alignment": "centerLeft",
                "width": 50.0,
                "height": 50.0,
                "name": "assets/imgs/visa.png"
            }
        },
        {
            "type": "ListTile",
            "title": {
                "type": "Text",
                "data": "Seu novo limite"
            },
            "subtitle": {
                "type": "Text",
                "data": "R\$ 5.000,00"
            }
        },
        {
            "type": "ListTile",
            "title": {
                "type": "Text",
                "data": "Sua nova modalidade"
            },
            "subtitle": {
                "type": "Text",
                "data": "2.0"
            }
        },
        {
            "type": "ListTile",
            "title": {
                "type": "Text",
                "data": "Sua nova bandeira"
            },
            "subtitle": {
                "type": "AssetImage",
                "alignment": "centerLeft",
                "width": 50.0,
                "height": 50.0,
                "name": "assets/imgs/mastercard.png"
            }
        },
        {
            "type": "Padding",
            "padding": "10,10,10,10",
            "child": {
                "type": "Text",
                "data": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                "maxLines": 10
            }
        },
        {
            "type": "Padding",
            "padding": "10,10,10,10",
            "child": {
                "type": "RaisedButton",
                "color": "##EC7000",
                "padding": "8,8,8,8",
                "textColor": "#FFFFFF",
                "splashColor": "#EC7000",
                "click_event": "route://productDetail?goods_id=123",
                "child": {
                    "type": "Text",
                    "data": "Prosseguir"
                }
            }
        }
    ]
}
''';
    return listIsNotEmpty
        ? Scaffold(
            appBar: render['header'],
            body: new RefreshIndicator(
              key: refreshKey,
              onRefresh: _getData,
              child: FutureBuilder<dynamic>(
                future: Maestrya(raisedButton_json).buildWidget(context),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  return snapshot.hasData
                      ? SizedBox.expand(
                          child: snapshot.data,
                        )
                      : Text("Loading...");
                },
              ),
              // child: new ListView.builder(
              //   padding: const EdgeInsets.all(20.0),
              //   itemCount: 1,
              //   itemBuilder: (BuildContext context, int index) {
              //     return new Column(
              //       children: childrenWidgets,
              //     );
              //   },
              // )
            ))
        : Scaffold(
            body: Center(
            child: Text("Not Render"),
          ));
  }
}
