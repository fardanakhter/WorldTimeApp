import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  bool showLoadingIndicator = false;

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty
        ? (ModalRoute.of(context)!.settings.arguments as Map)
        : data;
    String backgroundImage =
        (data["isDayTime"] as bool) ? "day.png" : "night.png";
    print('Received data on Home is: $data');

    return Scaffold(
        backgroundColor: Colors.blue[400],
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/$backgroundImage"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.white),
                      onPressed: () async {
                        // show loading indicator
                        setState(() {
                          showLoadingIndicator = true;
                        });

                        // Wait for edit location request completion
                        dynamic data =
                            await Navigator.pushNamed(context, "/location");

                        // Wait for few secs to stop loading indicator
                        // await Future.delayed(const Duration(seconds: 1));
                        setState(() {
                          showLoadingIndicator = false;
                          this.data = data;
                        });
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
            ),
            Visibility(
              visible: showLoadingIndicator,
              child: Container(
                color: Colors.black38,
                child: const Center(
                    child: SpinKitFadingCube(color: Colors.white, size: 50.0)),
              ),
            )
          ],
        ));
  }
}
