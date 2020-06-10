import 'package:exapandablelistviewblocarch/Bloc/post_bloc.dart';
import 'package:flutter/material.dart';

import 'model/postmodel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc.getPost();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder<List<Post>>(
          stream: bloc.subject.stream,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, indx) {
//                    return ExpansionTile(
//                      onExpansionChanged: ,
//                      leading: CircleAvatar(
//                        child: Text(snapshot.data[indx].id.toString()),
//                      ),
//                      subtitle: Text(snapshot.data[indx].title),
//                      children: <Widget>[
//                        ListTile(
//                          subtitle: Text(snapshot.data[indx].body),
//                        )
//                      ],
//                    );
                    return ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _counter = _counter == indx ? null : indx;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder: (context, bool isExpanded) {
                            return ListTile(
                              selected: _counter == indx ? true : false,
                              leading: CircleAvatar(
                                  child:
                                      Text(snapshot.data[indx].id.toString())),
                              subtitle: Text(snapshot.data[indx].title),
                            );
                          },
                          isExpanded: _counter == indx ? true : false,
                          body: ListTile(
                            subtitle: Text(snapshot.data[indx].body),
                          ),
                        )
                      ],
                    );
                  });
            }
          },
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
