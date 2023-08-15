import 'package:flutter/material.dart';
import 'package:world_time/service/world_time_service.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool hasTime = false;
  String text = "Loading...";

  setupWorldTimeService() async {
    // 2 secs delay
    await Future.delayed(const Duration(seconds: 2));

    WorldTimeService service =
        WorldTimeService("Portugal", "portugal.png", "/Europe/Lisbon");
    await service.getTime();
    setState(() {
      hasTime = true;
      DateTime? fetchedTime = service.time;
      text =
          fetchedTime == null ? "Could not fetch time" : fetchedTime.toString();
    });

    // 2 secs delay
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": service.location,
      "flag": service.flag,
      "time": service.time
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTimeService();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue[600],
      child: Center(
          child: Text(text,
              style: TextStyle(
                  color: hasTime ? Colors.amber[100] : Colors.white,
                  fontSize: 18.0,
                  letterSpacing: hasTime ? 2.0 : 4.0,
                  fontWeight: FontWeight.w500))),
    );
  }
}
