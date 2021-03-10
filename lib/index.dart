import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Indexpage extends StatefulWidget {
  @override
  _IndexpageState createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {
  Future getCountries() async {
    String url = 'https://restCountries.eu/rest/v2/all';
    var response = await http.get(url);
    //var response = await Dio().get('https://restCountries.eu/rest/v2/all');
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      return decoded;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff00171f),
      appBar: AppBar(
        backgroundColor: Color(0xff02B5C7),
        title: Text("Get Data From Api"),
      ),
      body: FutureBuilder(
          future: getCountries(),
          builder: (context, snapshot) {
            var snap = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color(0xfff3eddf),
                      child: ListTile(
                        leading: Container(
                          height: height * .09,
                          width: width * .2,
                          child: SvgPicture.network('${snap[index]['flag']}'),
                        ),
                        title: Text('Country>${snap[index]['name']}'),
                        subtitle: Text('Capital>${snap[index]['capital']}'),
                        trailing: Container(
                          height: height * .05,
                          width: width * .3,
                          child: Text(
                              'calling code${snap[index]['callingCodes']}'),
                        ),
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    ));
  }
}
