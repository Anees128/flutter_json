import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterjson/item.dart';

import 'index.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Getting Data From Api"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              builder: (context, snapshot) {
                var showData = json.decode(snapshot.data.toString());
                return ListView.builder(
                  itemCount: showData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(showData[index]["name"]),
                      subtitle: Text(showData[index]["age"]),
                    );
                  },
                );
              },
              future:
                  DefaultAssetBundle.of(context).loadString("assets/item.json"),
            ),
          ),
          RaisedButton(
              color: Color(0xffBE5BB8),
              child: Text("Click Me"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Indexpage()));
              }),
        ],
      ),
    ));
  }
}
