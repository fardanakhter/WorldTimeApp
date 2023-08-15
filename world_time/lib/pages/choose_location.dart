import 'package:flutter/material.dart';
import 'package:world_time/service/world_time_service.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTimeService> locations = [
    WorldTimeService('Europe/London', 'London', 'uk.png'),
    WorldTimeService('Europe/Berlin', 'Athens', 'greece.png'),
    WorldTimeService('Africa/Cairo', 'Cairo', 'egypt.png'),
    WorldTimeService('Africa/Nairobi', 'Nairobi', 'kenya.png'),
    WorldTimeService('America/Chicago', 'Chicago', 'usa.png'),
    WorldTimeService('America/New_York', 'New York', 'usa.png'),
    WorldTimeService('Asia/Seoul', 'Seoul', 'south_korea.png'),
    WorldTimeService('Asia/Jakarta', 'Jakarta', 'indonesia.png'),
    WorldTimeService('Asia/Karachi', 'Pakistan', 'pakistan.png'),
  ];

  Future<Map> updateLocation(int index) async {
    WorldTimeService service = locations[index];
    await service.getTime();
    return {
      "location": service.location,
      "flag": service.flag,
      "time": service.time ?? 'n/a',
      "isDayTime": service.isDayTime
    };
  }

  @override
  void initState() {
    super.initState();
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
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  onTap: () {
                    print(locations[index].location);
                    Future<Map> newLocation = updateLocation(index);
                    Navigator.pop(context, newLocation);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/${locations[index].flag}"))),
            );
          }),
    );
  }
}
