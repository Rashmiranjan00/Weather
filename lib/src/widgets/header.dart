import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/src/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final GlobalController weatherController = Get.put(GlobalController());

  String date = DateFormat('yMd').format(DateTime.now());
  String city = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAddress(weatherController.getLatitute().value,
        weatherController.getLongitude().value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   margin: const EdgeInsets.only(
        //     top: 5,
        //     left: 20,
        //     right: 20,
        //   ),
        //   alignment: Alignment.topLeft,
        //   child: const Text(
        //     'Today',
        //     style: TextStyle(
        //       fontSize: 14,
        //     ),
        //   ),
        // ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: const TextStyle(
              height: 1.3,
              fontSize: 35,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 30,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            date.replaceAll('/', '-'),
            style: const TextStyle(
              height: 1.3,
              fontSize: 14,
              color: Color(0xffBDBCE1),
            ),
          ),
        ),
      ],
    );
  }

  void _getAddress(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemarks[0];
    setState(() {
      city = '${place.subLocality}';
    });

    // print('city: $city');
  }
}
