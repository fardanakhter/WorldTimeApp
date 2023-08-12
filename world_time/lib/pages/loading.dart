import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getData() async {
    var url = Uri.http('worldtimeapi.org', '/api/timezone/Europe/London');
    Response response = await get(url);
    Map data = jsonDecode(response.body);

    String dateTimeString = data['utc_datetime'];
    String offsetString = data['utc_offset'].toString().substring(1, 3);
    // print('Date String is $dateTimeString');
    // print('Date Offset String is $offsetString');

    DateTime now = DateTime.parse(dateTimeString);
    print('UTC date is $now');
    now = now.add(Duration(hours: int.parse(offsetString)));
    print('London local date & time is $now');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue[600],
      child: const Center(
          child: Text("Loading...",
              style: TextStyle(color: Colors.white, fontSize: 18.0))),
    );
  }
}
