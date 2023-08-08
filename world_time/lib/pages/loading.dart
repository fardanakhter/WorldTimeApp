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
    var url = Uri.http('jsonplaceholder.typicode.com', '/todos/1');
    Response response = await get(url);
    Map map = jsonDecode(response.body);
    print(map['id']);
    print(map['title']);
    print(map['completed']);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Text("Loading Screen");
  }
}
