import 'package:flutter/material.dart';
import 'package:world_time/service/world_time_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String text = "Loading...";

  setupWorldTimeService() async {
    // 2 secs delay
    await Future.delayed(const Duration(seconds: 2));

    WorldTimeService service =
        WorldTimeService("/Europe/Lisbon", "Portugal", "portugal.png");
    await service.getTime();
    setState(() {
      text = service.time == null
          ? "Could not fetch time"
          : service.time.toString();
    });

    // 2 secs delay
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": service.location,
      "flag": service.flag,
      "time": service.time ?? 'n/a',
      "isDayTime": service.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTimeService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: const Center(
            child: SpinKitFadingCube(color: Colors.white, size: 50.0)));
  }
}
