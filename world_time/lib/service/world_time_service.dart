import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeService {
  String location;
  String flag;
  String url;
  late String? time;

  WorldTimeService(this.location, this.flag, this.url);

  Future<void> getTime() async {
    try {
      var api = Uri.http('worldtimeapi.org', '/api/timezone$url');
      Response response = await get(api);

      Map data = jsonDecode(response.body);
      String dateTimeString = data['utc_datetime'];
      String offsetString = data['utc_offset'].toString().substring(1, 3);

      DateTime now = DateTime.parse(dateTimeString);
      now = now.add(Duration(hours: int.parse(offsetString)));
      time = DateFormat.jm().format(now);
    } catch (error) {
      print(error);
      time = null;
    }
  }
}
