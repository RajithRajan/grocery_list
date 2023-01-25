import 'package:flutter/material.dart';
import './wigets/itemlist.dart';
import './wigets/newitem.dart';
import 'models/gritem.dart';
import 'wigets/itemsummary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Grocery App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final List<GrItem> groceries = [];
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool chartsw = true;
  void newitemadd(String iText, int iQty, String iUnit) {
    var item = GrItem(
      // itemNum: 1,
      itemText: iText,
      itemQty: iQty,
      itemUnits: iUnit,
      itemDate: DateTime.now(),
    );
    setState(() => widget.groceries.add(item));
  }

  void startNewItemadd(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: (() {}),
          behavior: HitTestBehavior.opaque,
          child: NewItem(newitemadd),
        );
      },
    );
  }

  void _deleteItem(DateTime itdate) {
    setState(() {
      widget.groceries.removeWhere((it) => it.itemDate == itdate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text(widget.title),
      actions: <Widget>[
        Switch(
          value: chartsw,
          onChanged: ((value) => {
                setState(() {
                  chartsw = value;
                })
              }),
        ),
        IconButton(
          icon: const Icon(
            Icons.add_alarm,
          ),
          onPressed: (() => startNewItemadd(context)),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if(chartsw) SizedBox(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.1,
            child: ItemSummary(
              widget.groceries,
            ),
          ),
          SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: ItemList(widget.groceries, _deleteItem)),
        ],
      ),
    );
  }
}
