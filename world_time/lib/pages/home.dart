import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    String backgroundImage =
        (data["isDayTime"] as bool) ? "day.png" : "night.png";
    print('Received data on Home is: $data');

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/$backgroundImage"), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, "/location");
              },
              icon: const Icon(Icons.edit_location),
              label: const Text("edit location")),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data['location'],
                style: const TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2.0),
              )
            ],
          ),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data['time'],
                style: const TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              )
            ],
          )
        ],
      ),
    ));
  }
}
