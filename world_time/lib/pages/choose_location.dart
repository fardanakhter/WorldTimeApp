import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  getData() async {
    String username = await Future.delayed(Duration(seconds: 3), () {
      return "fardan";
    });

    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'iOS & Flutter Ninja 🥷🏿';
    });

    print('$username - $bio');
  }

  @override
  void initState() {
    super.initState();
    print("entered initState()");
    getData();
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
