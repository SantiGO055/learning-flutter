// ignore_for_file: avoid_print

import 'package:app_incense/views/data/classes/activity.dart';
import 'package:flutter/material.dart';
import 'package:app_incense/views/data/constants.dart';
import 'package:app_incense/views/widgets/hero_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<Activity> getData() async {
    var url = Uri.https('apis.scrimba.com', '/bored/api/activity');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return Activity.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load person');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
          child: FutureBuilder(
              future: getData(),
              builder: ((context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Activity activity = snapshot.data;
                  widget = Column(
                    children: [
                      HeroWidget(title: "Home Page"),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(activity.activity,
                                    style: KTextStyle.titleTealText),
                                Text(
                                  activity.type,
                                  style: KTextStyle.descriptionText,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox.shrink(),
                                    Text(
                                      '\$ ${activity.price}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  widget = Center(child: Text('Error'));
                } else {
                  widget = Center(child: CircularProgressIndicator());
                }

                return widget;
              }))),
    );
  }
}
