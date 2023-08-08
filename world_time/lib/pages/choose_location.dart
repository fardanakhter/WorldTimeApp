import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  getDataSynchronously() async {
    // Runs 2 tasks synchronously (serially)
    String username = await Future.delayed(Duration(seconds: 3), () {
      print("fetching username....");
      return "fardan";
    });

    String bio = await Future.delayed(Duration(seconds: 2), () {
      print("fetching bio....");
      return 'iOS & Flutter Ninja 🥷🏿';
    });

    print('$username - $bio'); // gets result printed in 3 + 2 secs
  }

  getDataAsynchronously() async {
    // Runs 2 tasks asynchronously (parallel)
    Future<String> username = Future.delayed(Duration(seconds: 3), () {
      print("fetching username....");
      return "fardan";
    });

    Future<String> bio = Future.delayed(Duration(seconds: 2), () {
      print("fetching bio....");
      return 'iOS & Flutter Ninja 🥷🏿';
    });

    await Future.wait([username, bio]);
    print('$username - $bio'); // gets result printed in 3 secs
  }

  @override
  void initState() {
    super.initState();
    print("entered initState()");
    // getDataSynchronously();
    getDataAsynchronously();
    print("exiting initState()");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text(
          "Choose a Location",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
